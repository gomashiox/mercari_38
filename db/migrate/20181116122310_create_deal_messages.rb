class CreateDealMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :deal_messages do |t|
      t.text :message, null: false, limit: 1000
      t.string :deal_id, null: false, foreign_key: true
      t.string :user_id, null: false, foreign_key: true
    end
  end
end