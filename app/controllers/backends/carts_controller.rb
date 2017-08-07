class Backends::CartsController < BackendsController
	skip_before_filter :verify_authenticity_token
	skip_before_action :check_login


	def add_session
		if session[:cart_id].blank?
			session[:cart_id] = Hash.new
		end
			session[:cart_id]["cart"+params[:id]] = params[:id]
			render json: session
	end
	
	def delete_session
		session[:cart_id].delete("cart#{params[:id]}")
		
		render text: 'delete'
	end
end
