class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :fb_name
      t.string :study_at
      t.string :phone
      t.string :price
      t.string :product_id ,array: true, default: []
      t.string :count,array: true, default: []

      t.timestamps null: false
    end
  end
end
