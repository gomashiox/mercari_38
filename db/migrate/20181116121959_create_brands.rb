class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.references :category_l, null: false
    end
    add_index :brands, :name
  end
end