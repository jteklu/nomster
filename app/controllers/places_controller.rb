class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		#This is the new and shorter form of writing the page code.
		@places = Place.page(params[:page]).order('created_at DESC')
		
		#These are additional ways of writing this code, learn them and practice it.
		#@places = Place.paginate :page => params[:page], :order => 'created_at DESC'
		#@places = Place.paginate(:page => params[:page], :order => 'created_at DESC')
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
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])
		@place.update_attributes(place_params)
		redirect_to root_path
	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to root_path
	end

	private

	def place_params
		params.require(:place).permit(:name, :address, :description)
	end

end