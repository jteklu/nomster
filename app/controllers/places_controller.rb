class PlacesController < ApplicationController
	def index
		#This is the new and shorter form of writing the page code.
		@places = Place.page(params[:page]).order('created_at DESC')
		
		#These are additional ways of writing this code, learn them and practice it.
		#@places = Place.paginate :page => params[:page], :order => 'created_at DESC'
		#@places = Place.paginate(:page => params[:page], :order => 'created_at DESC')
	end
end
