class AddCondtnToBills < ActiveRecord::Migration[6.1]
  def change
    add_column :bills, :condtn, :string
  end
end
