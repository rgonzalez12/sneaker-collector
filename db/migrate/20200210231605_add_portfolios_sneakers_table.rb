class AddPortfoliosSneakersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios_sneakers do |t|
      t.integer :sneaker_id
      t.integer :portfolio_id
    end
    
    change_table :sneakers do |t|
      t.delete :portfolio_id
    end
    
    change_table :portfolios do |t|
      t.delete :sneaker_id
    end
  end
end