class CreateSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :sneakers do |t|
      t.string :manufacturer
      t.string :size_us
      t.string :model
      t.string :colorway
      t.string :notes
      t.string :condition
      t.integer :est_value
      t.integer :user_id
      t.timestamps
    end
  end
end
