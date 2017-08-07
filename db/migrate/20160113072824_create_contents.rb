class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.integer :category_id
      t.integer :content_type
      t.text :content
      t.string :intro
      t.integer :rank,         default: 0
      t.boolean :del_mark,     default: false

      t.timestamps null: false
    end
  end
end
