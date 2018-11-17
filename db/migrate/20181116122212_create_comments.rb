class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment, null: false, limit: 1000
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end