class DeleteUsersPortfolioId < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :portfolio_id
  end
end
