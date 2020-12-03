class AddTickerToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :ticker, :string
  end
end
