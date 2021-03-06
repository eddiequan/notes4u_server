class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :update, :destroy]

  # GET /notifications
  def index
    @notifications = Notification.all

    render json: @notifications
  end

  # GET /notifications/1
  def show
    render json: @notification
  end

  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: @notification, status: :created, location: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
    if @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
  end

  def new_notifications
    @notifications = Notification.all.where(status: 0, user_id: params[:user_id])
    @notifications.each do |notification|
      notification.update(status: 1)
    end

    render json: @notifications
  end

  def get_notifications
    @notifications = Notification.all.where(user_id: params[:user_id]).order(:id).reverse_order
    
    render json: @notifications
  end

  def for_user
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:user_id, :notification)
    end
end
