class CreateInvestors < ActiveRecord::Migration[6.0]
  def change
    create_table :investors do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :bio

      t.timestamps
    end
  end
end
