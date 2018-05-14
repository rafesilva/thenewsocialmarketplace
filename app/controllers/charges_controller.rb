    class ChargesController < ApplicationController
      before_action :authenticate_user!
      before_action :amount_to_be_charged
      include CurrentCart
      before_action :set_cart
    
      def new
      end
    
      def create
        customer = StripeTool.create_customer(email: params[:stripeEmail], 
                                              stripe_token: params[:stripeToken])
    
        charge = StripeTool.create_charge(customer_id: customer.id, 
                                          amount: @amount,
                                          description: 'Rails Stripe customer')
    
      rescue Stripe::CardError => e
        flash[:error] = e.message
        @cart_id = nil
        redirect_to new_charge_path
      end
    
      private
    
        def amount_to_be_charged
          amount = (@cart.total_price)*100
          @amount = amount.to_i
        end
    end