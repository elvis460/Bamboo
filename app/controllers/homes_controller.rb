class HomesController < ApplicationController
	def index
		@products = Product.includes(:attachment)
	end
end
