class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.string :otp_secret
      t.datetime :last_otp_at

      t.timestamps null: false
    end
  end
end
