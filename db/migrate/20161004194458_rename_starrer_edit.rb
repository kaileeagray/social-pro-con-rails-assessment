class RenameStarrerEdit < ActiveRecord::Migration[5.0]
  def change
    rename_column :stars, :starrer_edit, :admin
  end
end
