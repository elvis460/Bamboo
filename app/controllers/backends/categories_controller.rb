class Backends::CategoriesController < BackendsController

  before_action :find_category,except: [:index]

  skip_before_filter :verify_authenticity_token,only: [:sort]

  def index
    @categories = Category.mark
  end

  def new
    render layout: false
  end

  def create
    @category.update(category_params_permit)

    redirect_to :back,flash: { success: '新增成功'}
  end

  def edit
    render layout: false
  end

  def sort
    @categories = Category.mark.where(id: params[:sort])

    @categories.each do |c|
      c.update(rank: params[:sort].index(c.id.to_s))
    end

    render json: 'sort_success'
  end

  def update
    @category.update(category_params_permit)

    redirect_to :back,flash: { success: '更新成功'}
  end

  def destroy
    @category.update(del_mark: true)

    redirect_to :back,flash: { success: '刪除成功'}
  end

  private

  def category_params_permit
    params.require(:category).permit(:name, :category_type)
  end

  def find_category
    @category = Category.find_by(id: params[:id]) ? Category.find_by(id: params[:id]) : Category.new
  end

end
