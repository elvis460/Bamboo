class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name
      t.string :title
      t.string :description
      t.string :keyword
      t.string :email
      t.string :phone
      t.string :fax
      t.string :address
      t.string :facebook

      t.timestamps null: false
    end
  end
end
