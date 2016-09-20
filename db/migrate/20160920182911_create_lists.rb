class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title, :null => false, :limit => 80
      t.text :description, :null => true, :limit => 280
      t.references :user, foreign_key: true, :null => false

      t.timestamps
    end
    #want to retrieve lists associated with a given user id in reverse order
    #of creation -- adds an index on the user_id and created_at columns
    add_index :lists, [:user_id, :created_at]
  end
end
