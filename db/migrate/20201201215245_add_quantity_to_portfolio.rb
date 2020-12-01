class AddQuantityToPortfolio < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :quantity, :integer
  end
end
