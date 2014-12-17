class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
	def index
		@places = Place.all 
		@places = Place.paginate(:page => params[:page], :per_page => 3)
	end

	def new
		@place = Place.new
	end

	def create
		current_user.places.create(place_params)
		redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
	end

	def update #the code here will get executed when user hits UPDATE button on edit form. 
		@place = Place.find(params[:id])
		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
		@place.update_attributes(place_params)
		redirect_to root_path
	end

	def destroy
		@place = Place.find(params[:id])
		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
		@place.destroy
		redirect_to root_path
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address, :perfect_for)
	end 

end
