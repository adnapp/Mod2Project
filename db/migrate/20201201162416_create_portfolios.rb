class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.integer :investor_id
      t.integer :stock_id
      t.float :price
      t.boolean :buysell

      t.timestamps
    end
  end
end
