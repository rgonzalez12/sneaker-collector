class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.integer :sneaker_id
      t.integer :total_value
    end
  end
end
