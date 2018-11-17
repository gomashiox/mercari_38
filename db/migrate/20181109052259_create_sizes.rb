class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.string :category_s_id, null: false
      t.string :name
    end
  end
end