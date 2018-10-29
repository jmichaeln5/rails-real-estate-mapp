class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
