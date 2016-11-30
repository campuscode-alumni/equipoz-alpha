class CreateCategoryPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :category_prices do |t|
      t.belongs_to :category, foreign_key: true
      t.integer :rental_period
      t.float :price

      t.timestamps
    end
  end
end
