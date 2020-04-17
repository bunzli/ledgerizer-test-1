class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.references :winner, references: :users
      t.references :casino

      t.timestamps
    end
  end
end
