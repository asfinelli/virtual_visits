class ChargesController < ApplicationController
  def new
  end

# def index
# end
  def create
    # Amount in cents
    @amount = 500
   # set up params that coorilates to shopping cart amount
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    redirect_to new_appointment_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
