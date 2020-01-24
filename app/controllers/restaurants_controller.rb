class RestaurantsController < ApplicationController
	before_action :set_restaurant, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found	


	def index
		@restaurants = Restaurant.all
	  respond_to do |format|
	    format.html # index.html.erb
	    format.json { render json: @restaurants }
	  end
	end

	def show
		respond_to do |format|
	    format.html # index.html.erb
	    format.json { render json: @restaurant }
	  end
	end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: @restaurant, status: :created
    else
      render json: { errors: @restaurant.errors}, status: :unprocessable_entity
    end
  end

	private 
		def set_restaurant
    	@restaurant = Restaurant.find(params[:id])
    end

    def record_not_found
      head :not_found
    end

    def restaurant_params
      params.require(:restaurant).permit(:id, :name, :phone, :address, :website)
    end
end
