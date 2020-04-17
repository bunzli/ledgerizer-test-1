class CreateWithdrawals < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrawals do |t|
      t.references :user, foreign_key: true
      t.integer :bananas

      t.timestamps
    end
  end
end
