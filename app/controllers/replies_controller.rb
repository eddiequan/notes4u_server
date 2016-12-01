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

    if @reply.save
      render json: @reply, status: :created, location: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /replies/1
  def update
    if @reply.update(reply_params)
      render json: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replies/1
  def destroy
    @reply.destroy
  end

  def accepted
    @replies = Reply.all.where(slacker_id: params[:id], status: ACCEPTED)

    render json: @replies
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reply_params
      params.require(:reply).permit(:req_id, :user_id, :status)
    end
end
