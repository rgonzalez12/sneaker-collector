class AddConstraintToUserEmail < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.index :email_address, unique: true
    end
  end
end
