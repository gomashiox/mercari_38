class CreateCategoryMs < ActiveRecord::Migration[5.0]
  def change
    create_table :category_ms do |t|
      t.string :name, null: false
      t.references :category_l, null: false, foreign_key: true
    end
  end
end