class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname, limit: 20
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.text :profile, limit: 10000
      t.string :phone_number, default: ""
      t.string :first_name, limit: 35
      t.string :last_name, limit: 35
      t.string :first_name_kana, limit: 35
      t.string :last_name_kana, limit: 35
      t.string :zipcode
      t.string :prefecture
      t.string :city
      t.string :address_1
      t.string :address_2
      t.string :birthday
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :seller_id
      t.integer :buyer_id
    end
    add_index :users, [:email, :reset_password_token], unique: true
  end
end