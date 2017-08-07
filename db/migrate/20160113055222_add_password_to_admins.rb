class AddPasswordToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :password_digest, :string
  end
end
