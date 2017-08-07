class AddLinkToContents < ActiveRecord::Migration
  def change
    add_column :contents, :link, :string
  end
end
