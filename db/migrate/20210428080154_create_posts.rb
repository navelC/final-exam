class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :address
      t.string :status
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true
      t.string :descript

      t.timestamps
    end
  end
end
