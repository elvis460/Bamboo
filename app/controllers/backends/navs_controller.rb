class Backends::NavsController < BackendsController

  before_action :find_nav,except: :index

  skip_before_filter :verify_authenticity_token,only: :sort

  def index
    if Nav.nav_types.keys.include?(params[:type])
      @navs = Nav.mark.send(params[:type])
    else
      @navs = Nav.mark
    end

    @navs = @navs.where(parent_id: params[:parent_id])

  end


  def new

    render layout: false
  end

  def create
    @nav.update(nav_params_permit)

    redirect_to :back,flash: {success: "Create Success!"}
  end

  def edit
    render layout: false
  end

  def sort
    @navs = Nav.mark.where(id: params[:sort])

    @navs.each do |n|
      n.update(rank: params[:sort].index(n.id.to_s))
    end

    render json: 'sort_success'
  end


  def update
    @nav.update(nav_params_permit)

    redirect_to :back,flash: {success: "Update Success!"}
  end

  def destroy
    @nav.update(del_mark: true)

    redirect_to :back,flash: {success: "Delete Success!"}
  end

  private

  def find_nav
    @nav = params[:id] ? Nav.find_by(id: params[:id]) : Nav.new
  end

  def nav_params_permit
    params.require(:nav).permit(:url,:nav_type,:parent_id,:name)
  end
end
