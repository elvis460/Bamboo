class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
  scope :mark,-> {where(del_mark: false).order('rank')}
  belongs_to :attachmenttable, :polymorphic => true

  def mini_magick
    if self.file.present?
      url = "#{Rails.root}/public#{self.file.url}"
      i = MiniMagick::Image.open(url)
      MiniMagick::Tool::Convert.new do |convert|
        convert << url
        convert.merge! ["-strip", "-quality", "75%"]
        convert << url
      end

    #self.file.recreate_versions!(:thumb)
    end
  end
end
