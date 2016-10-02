class AddSourcetoLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :source, :string, :null => true
  end
end
