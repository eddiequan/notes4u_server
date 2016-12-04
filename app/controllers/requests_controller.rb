class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # GET /requests
  def index
    @requests = Request.all
    render json: @requests
  end

  # GET /requests/1
  def show
    render json: @request
  end

  # GET /requests/1/replies
  def replies
    @replies = Reply.where(request_id: params[:id])
    render json: @replies
  end

  # POST /requests
  def create
    pp "GOT IN HERE @@@@@@@!!!!!!!!!!!!"
    @request = Request.new(request_params)
    pp request_params

    if @request.save
      render json: @request, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:user_id, :course_id, :when, :location)
    end

end
