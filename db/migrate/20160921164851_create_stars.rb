class CreateStars < ActiveRecord::Migration[5.0]
  def change
    create_table :stars do |t|
      t.references :list, foreign_key: true
      t.integer :starrer_id

      t.timestamps
    end

    add_index :stars, :starrer_id
    add_index :stars, [:list_id, :starrer_id], unique: true
  end
end
