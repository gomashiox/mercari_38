class CreateDealMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :deal_messages do |t|
      t.string :message, null: false
      t.string :deal_id, null: false
      t.string :user_id, null: false
    end
  end
end