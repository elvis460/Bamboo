class CreateNavs < ActiveRecord::Migration
  def change
    create_table :navs do |t|
      t.string :url
      t.integer :nav_type
      t.integer :rank
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth,   default: 0
      t.integer :children_count,   default: 0
      t.boolean :del_mark,         default: false
      t.string :name

      t.timestamps null: false
    end
  end
end
