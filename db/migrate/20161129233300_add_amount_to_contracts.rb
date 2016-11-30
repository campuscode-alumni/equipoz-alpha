class AddAmountToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :amount, :float
  end
end
