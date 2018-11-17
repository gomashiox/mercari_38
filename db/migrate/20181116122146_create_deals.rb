class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.references :item, null: false, foreign_key: true, index: true
      t.datetime :dealt_at, null:false
      t.integer :seller_id, null:false, foreign_key: true
      t.integer :buyer_id, null:false, foreign_key: true
    end
  end
end
