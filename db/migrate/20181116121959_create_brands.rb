class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name, index: true
      t.references :category_l, null: false
    end
  end
end