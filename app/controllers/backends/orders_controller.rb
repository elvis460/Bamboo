class Backends::OrdersController < BackendsController
	skip_before_action :check_login
	def create
		@order = Order.create(order_params)
		@order.trace_fb_id = session[:from_fb] if session[:from_fb].present?
		@sum = 0
		@order.product_id.each_with_index do |product,index|
			@product = Product.find(product)
			@sum += @product.price.to_i * @order.count[index].to_i
		end
		@order.price = @sum
		@order.save
		session[:cart_id]=nil
		redirect_to homes_products_order_build_path(id: @order.id),flash: { success: '預購成功'}
	end

	def index
		headers['Content-Type'] = "application/vnd.ms-excel"
		headers['Content-Disposition'] = 'attachment; filename="list.xls" '
		headers['Cache-Control'] = ''
		@orders = Order.all
		render layout: false
	end
	private
	def order_params
		params.require(:order).permit(:name,:fb_name,:study_at,:phone,product_id: [],count: [])
	end
end
