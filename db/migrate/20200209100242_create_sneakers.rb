class CreateSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :sneakers do |t|
      t.string :manufacturer
      t.string :size_us
      t.string :model
      t.string :colorway
      t.integer :est_value
      t.integer :portfolio_id
      t.timestamps
    end
  end
end
