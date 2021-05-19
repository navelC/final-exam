class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.integer :amount
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
<<<<<<< HEAD
      t.date :rent_date
      t.date :return_date
=======
      t.datetime :rent_date
      t.datetime :return_date
>>>>>>> upstream/master

      t.timestamps
    end
  end
end
