class BackendsController < ApplicationController
  before_action :check_login
  def index

  end

  def destroy
    render json: params
  end

  def check_login
    @admin = Admin.find_by(id: session[:admin_id])
    if @admin.blank?
      redirect_to login_backends_admins_path,flash: { success: '請先登入'}
    end
  end
end
