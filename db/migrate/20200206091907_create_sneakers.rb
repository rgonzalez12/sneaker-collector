class CreateSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :sneaker_info do |t|
    t.string :manufacturer
    t.string :colorway
    t.string :size
    t.string :condition
    t.float :estimated_value
    t.integer :user_id
    t.timestamps
   end
  end
end
