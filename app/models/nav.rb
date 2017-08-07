class Nav < ActiveRecord::Base
  scope :mark,-> {where(del_mark: false).order('rank')}
  scope :main,-> {where(parent_id: nil)}

  acts_as_nested_set

  enum nav_type: %w(header footer)
  def parent
    parent = Nav.find(self.parent_id)
    return parent
  end
end
