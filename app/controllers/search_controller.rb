class SearchController < ApplicationController

    include CurrentCart
    before_action :set_cart

    def search
        unless params[:query].blank?
          @results = User.search( params[:query] )
        end
      end
    
    end