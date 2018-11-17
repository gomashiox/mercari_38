class CreateCategoryS < ActiveRecord::Migration[5.0]
  def change
    create_table :category_s do |t|
      t.string :name, null: false
      t.references :category_m, null: false, foreign_key: true
    end
  end
end