class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.string :seri
      t.string :code
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
