class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
    json_response(@orders)
  end

  # POST /orders
  def create
    @order = Order.create!(order_params)
    json_response(@order, :created)
  end

  # GET /orders/:id
  def show
    json_response(@order)
  end

  # PUT /orders/:id
  def update
    @order.update(order_params)
    head :no_content
  end

  # DELETE /orders/:id
  def destroy
    @order.destroy
    head :no_content
  end

  private

  def order_params
    # whitelist params
    params.permit(:start_location_id, :finish_location_id, :created_at, :start_date, :finish_date, :create_user_id, :status_id, :assigned_to_user_id, :description, :priority_id, :available_from, :available_to, :vehicle_id, :ware_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
