class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_type
      t.integer :rank
      t.boolean :del_mark,     default: false

      t.timestamps null: false
    end
  end
end
