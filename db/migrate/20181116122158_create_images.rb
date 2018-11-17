class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image_url, null: false
      t.references :user, null: false, foreign_key: true
    end
  end
end
