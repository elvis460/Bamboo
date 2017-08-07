class Backends::ContentsController < BackendsController
  before_action :find_content,except:  [:index]
  before_action :find_categories
  def index
    if Content.content_types.keys.include?(params[:type])
      @contents = Content.mark.send(params[:type])
    else
      @contents = Content.mark
    end
  end

  def new
    @content.content_type = params[:type]
    @content.build_attachment
    @attachments = @content.attachments
  end

  def create
    @content.update(content_params_permit)
    update_attachment

    redirect_to backends_contents_path(type: @content.content_type) ,flash: { success: '新增成功'}
  end

  def edit
    @content.build_attachment
  end

  def update
    @content.update(content_params_permit)
    update_attachment

    redirect_to :back,flash: { success: '更新成功'}
  end

  def destroy
    @content.update(del_mark: true)

    redirect_to :back,flash: { success: '刪除成功'}
  end

  private

  def content_params_permit
    params.require(:content).permit(:title, :content, :category_id,:content_type,:intro)
  end

  def update_attachment
    @attachments = Attachment.where(id: params[:attachment][:id])
    @attachments.update_all(attachmenttable_type: @content.class.name,attachmenttable_id: @content.id)
  end

  def find_content
    @content = Content.find_by(id: params[:id]) ? Content.find_by(id: params[:id]) : Content.new
  end

  def find_categories
    @categories = Category.mark
  end
end
