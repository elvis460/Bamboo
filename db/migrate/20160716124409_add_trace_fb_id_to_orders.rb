class AddTraceFbIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :trace_fb_id, :string
  end
end
