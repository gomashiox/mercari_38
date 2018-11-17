class CreateCategoryLs < ActiveRecord::Migration[5.0]
  def change
    create_table :category_ls do |t|
      t.string :name, null: false
    end
  end
end
