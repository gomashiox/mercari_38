class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email, null: false
      t.string :encrypted_password, null: false, limit: 6
      t.text :profile
      t.string :phone_number, null: false, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :birthday, null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :seller_id, null:false
      t.string :buyer_id, null:false
    end
    add_index :users, [:email, :reset_password_token], unique: true
  end
end