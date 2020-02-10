class AddColumnToSneakers < ActiveRecord::Migration[5.2]
  def change
    add_column :sneakers, :notes, :string
  end
end
