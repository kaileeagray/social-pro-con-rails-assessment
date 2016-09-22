class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :list, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
