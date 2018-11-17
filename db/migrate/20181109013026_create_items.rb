class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.integer :price, null:false
      t.string :condition, null:false
      t.text :description, null:false
      t.integer :status, null:false
      t.integer :shipping_fee, null:false
      t.integer :arrived_date, null:false
      t.integer :like_count, null:false
      t.integer :category_s_id, null:false
      t.integer :category_m_id, null:false
      t.integer :category_l_id, null:false
      t.integer :seller_id, null:false
      t.integer :buyer_id, null:false
    end
    add_index :items, :name
  end
end