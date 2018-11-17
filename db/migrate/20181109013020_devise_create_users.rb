class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname, limit: 20
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.text :profile, limit: 10000
      t.string :phone_number, null: false, unique: true
      t.string :first_name, null: false, limit: 35
      t.string :last_name, null: false, limit: 35
      t.string :address, null: false
      t.string :birthday, null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :seller_id, null:false
      t.integer :buyer_id, null:false
    end
    add_index :users, [:email, :reset_password_token], unique: true
  end
end