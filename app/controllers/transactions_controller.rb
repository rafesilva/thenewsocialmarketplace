class TransactionsController < ApplicationController
    include CurrentCart
    before_action :set_cart
    
    def create

      Stripe.api_key = Rails.configuration.stripe[:stripe_secret_key]
        # Amount in cents
        @amount = (@cart.total_price)*10
      
        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken]
        )
      
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => params[:amount],
          :description => 'Rails Stripe customer',
          :currency    => 'usd',
          :destination => {
            :amount => 10,
            :account => ENV['CONNECTED_STRIPE_ACCOUNT_ID']
    }

      purchase = Purchase.create( email: params[:stripeEmail], card: params[:stripeToken], amount: params[:amount], description: charge.description, currency: charge.currency, customer_id: customer.id, product_id:1 )
    
      redirect_to purchase

        
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to streaming_index_path, notice: "Error"
      end
    end
  