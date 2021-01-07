class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    # default: false shows users will not be admin by default
    add_column :users, :admin, :boolean, default: false
  end
end
