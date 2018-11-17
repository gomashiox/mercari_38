class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null:false, limit: 60
      t.integer :price, null:false
      t.string :condition, null:false
      t.text :description, null:false, limit: 1000
      t.string :shipping_fee, null:false
      t.string :arrived_date, null:false
      t.integer :like_count, null:false
      t.references :category_s, null:false, foreign_key: true
      t.references :category_m, null:false, foreign_key: true
      t.references :category_l, null:false, foreign_key: true
      t.references :size, null:false, foreign_key: true
      t.integer :seller_id
      t.integer :buyer_id
    end
    add_index :items, :name
  end
end