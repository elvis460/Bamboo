class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :attachmenttable_type
      t.string :attachmenttable_id
      t.string :file
      t.boolean :del_mark,                         default: false
      t.integer :rank

      t.timestamps null: false
    end
  end
end
