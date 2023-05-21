class AddUserIdToRevenues < ActiveRecord::Migration[7.0]
  def change
    add_reference :revenues, :user, null: false, foreign_key: true
  end
end
