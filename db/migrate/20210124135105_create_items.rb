class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,        null: false, foreign_key: true 
      t.integer :price,          null: false
      t.string :item_name,       null: false
      t.text :description,       null: false
      t.timestamps
    end
  end
end