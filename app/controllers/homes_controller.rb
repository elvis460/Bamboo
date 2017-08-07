class HomesController < ApplicationController
	def index
		@products = Product.includes(:attachment)
    session[:from_fb] = params[:customer] if params[:customer]
	end

	def map_view
		render json: "http://bamboo.villager.website"+Content.last.attachment.file.url
	end
end
