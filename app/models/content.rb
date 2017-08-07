class Content < ActiveRecord::Base
  scope :mark,-> {where(del_mark: false).order('rank')}

  has_many :attachments,-> {mark}, :as => :attachmenttable
  has_one :attachment,-> {mark}, :as => :attachmenttable
  belongs_to :category

  enum content_type: %w(about exhibition news report banner slideshow)
  def collection_content_type
    Content.content_types.keys
  end

  def attachment_limit
    if self.content_type == "page"
    attachment_limit = 1
    elsif self.content_type == "project"
    attachment_limit = 3
    else
    attachment_limit = 3
    end
    return attachment_limit
  end

  def attachment_size
    if self.content_type == "page"
      attachment_size = nil
    elsif self.content_type == "project"
      attachment_size = "940*705"
    else
      attachment_size = nil
    end
    return attachment_size
  end

  def build_attachment
    if self.attachments.count < self.attachment_limit
      (self.attachment_limit - self.attachments.count).times do
        self.attachments.build
      end
    end
  end

end
