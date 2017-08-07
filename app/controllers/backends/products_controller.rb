class Backends::ProductsController < BackendsController
  before_action :find_product,except:  [:index]
  def index
      @products = Product.all
  end

  def new
    @product.build_attachment
    @attachments = @product.attachments
  end

  def create
    @product.update(product_params_permit)
    update_attachment

    redirect_to backends_products_path,flash: { success: '新增成功'}
  end

  def edit
    @product.build_attachment
  end

  def update
    @product.update(product_params_permit)
    update_attachment

    redirect_to :back,flash: { success: '更新成功'}
  end

  def destroy
    @product.update(del_mark: true)

    redirect_to :back,flash: { success: '刪除成功'}
  end

  private

  def product_params_permit
    params.require(:product).permit(:name, :price,:intro,:category_id)
  end

  def update_attachment
    @attachments = Attachment.where(id: params[:attachment][:id])
    @attachments.update_all(attachmenttable_type: @product.class.name,attachmenttable_id: @product.id)
  end

  def find_product
    @product = Product.find_by(id: params[:id]) ? Product.find_by(id: params[:id]) : Product.new
  end

end
