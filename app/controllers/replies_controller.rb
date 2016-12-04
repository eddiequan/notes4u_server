class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :update, :destroy]

  UNACCEPTED = 0
  PENDING = 1
  ACCEPTED = 2

  # GET /replies
  def index
    @replies = Reply.all

    render json: @replies
  end

  # GET /replies/1
  def show
#    if signed_in?
#      @reply = Reply.find(params[:id])
#      @my_replies = current_user.replies
#      render json: @my_replies
#    else
    render json: @reply
#    end
  end

  # POST /replies
  def create
    @reply = Reply.new(reply_params)
    request = Request.where(id: @reply.request_id).first
    if @reply.save
      request.update_attributes!(status: 1)

      create_notification_for_slacker(@reply)

      render json: @reply, status: :created, location: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  def create_notification_for_slacker(reply)
    user = User.where(id: reply.notetaker_id).first
    notification = Notification.new(message: "#{user.first_name} has responded to your request!", user_id: reply.slacker_id)
    notification.save!
  end

  # PATCH/PUT /replies/1
  def update
    if @reply.update(reply_params)
      render json: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # THIS IS FOR WHEN THE SLACKER APPROVES OF A NOTETAKER
  # TODO: RENAME THIS METHOD TO "APPROVE" OR SOMETHING
  def approve_request
    @reply = Reply.where(id: params[:id]).first
    request = Request.where(id: @reply.request_id).first
    if @reply.update(reply_params)
      request.update_attributes!(status: 2)
      create_notification_for_notetaker(@reply)
      render json: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  def create_notification_for_notetaker(reply)
    user = User.where(id: reply.slacker_id).first
    notification = Notification.new(message: "#{user.first_name} has appointed you as a Notetaker!", user_id: reply.notetaker_id)
    notification.save!
  end

  # DELETE /replies/1
  def destroy
    @reply.destroy
  end 

  def accepted
    @replies = Reply.all.where(notetaker_id: params[:id], status: ACCEPTED)

    render json: @replies
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reply_params
      params.require(:reply).permit(:notetaker_id, :request_id, :status, :slacker_id)
    end
end
