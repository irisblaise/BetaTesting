class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
  end

  def create
    @stripe = StripeChargesServices.new(charges_params, current_user).call
    if @stripe.save
      redirect_to new_charge_path
    else
      render "new"
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end
