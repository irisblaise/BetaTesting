class OrdersController < ApplicationController
  def show
    @order = Order.find params[:id]
    authorize @order
  end

  def update
    @order = Order.find params[:id]
    Order.update state: 'paid'

    authorize @order
    redirect_to edit_startup_version_path(@order.startup, @order.version)
  end
end
