class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :account
      t.string :password_digest
      t.integer :coin
      t.string :role

      t.timestamps
    end
  end
end
