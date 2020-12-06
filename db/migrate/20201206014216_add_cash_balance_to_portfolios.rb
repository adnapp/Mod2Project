class AddCashBalanceToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :cash_balance, :integer
  end
end
