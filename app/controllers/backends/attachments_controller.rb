class Backends::AttachmentsController < BackendsController
 skip_before_filter :verify_authenticity_token

  before_action :find_attachment

  def new
    render layout: false,template: "backends/attachments/_form"
  end

  def create
    @attachment = Attachment.new
    @attachment.file = params[:file]
    @attachment.save

    render json: @attachment.to_json
  end

  def sort
    @attachments = Attachment.mark.where(id: params[:sort])

    @attachments.each do |a|
      a.update(rank: params[:sort].index(a.id.to_s))
    end

    render json: 'sort_success'
  end

  def update
    @attachment.update(file: params[:file])

    render json: @attachment.to_json
  end

  def delete
    @attachment.update(del_mark: true)
    render json: @attachment.to_json
  end

  def ck_upload
    @attachment = Attachment.create(file: params[:upload],del_mark: true)

    # render :text=>u.obj_tmp.url
    render  :text=> "<script>window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]},\"#{@attachment.file.url}\")</script>"
    return
  end

  private

  def find_attachment
    @attachment = Attachment.find_by(id: params[:id]) ? Attachment.find_by(id: params[:id]) : Attachment.new
  end

  def attachment_params_permit
    params.require(:attachment).permit(:file,:attachmenttable_type, :attachmenttable_id)

  end
end
