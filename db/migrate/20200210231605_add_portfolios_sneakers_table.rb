class AddPortfoliosSneakersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios_sneakers do |t|
      t.integer :sneaker_id
      t.integer :portfolio_id
    end
    
    
    remove_column :sneakers, :portfolio_id
    remove_column :portfolios, :sneaker_id
  end
end