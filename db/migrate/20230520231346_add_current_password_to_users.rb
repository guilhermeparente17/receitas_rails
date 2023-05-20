class AddCurrentPasswordToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :current_password, :string
  end
end
