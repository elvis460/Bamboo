class Homes::ProductsController < HomesController
	def index
		@products = Product.all
	end
	def order_build
		@order = Order.find(params[:id])
	end
end
