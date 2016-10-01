class RemoveOldFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :reset_digest
    remove_column :users, :reset_sent_at
    remove_column :users, :remember_digest
    remove_column :users, :password_digest
  end
end
