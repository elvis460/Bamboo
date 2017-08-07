class Product < ActiveRecord::Base
	belongs_to :order
  	has_many :attachments, :as => :attachmenttable
  	has_one :attachment, :as => :attachmenttable

  def build_attachment
        self.attachments.build
  end
end
