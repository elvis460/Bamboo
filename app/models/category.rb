class Category < ActiveRecord::Base
  scope :mark,-> {where(del_mark: false).includes(:contents).order('rank')}

  has_many :contents

  enum category_type: %w(project)
  def collection_category_type
    Category.category_types.keys
  end
end
