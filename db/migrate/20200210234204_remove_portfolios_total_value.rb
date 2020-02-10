class RemovePortfoliosTotalValue < ActiveRecord::Migration[5.2]
  def change
    remove_column :portfolios, :total_value
  end
end
