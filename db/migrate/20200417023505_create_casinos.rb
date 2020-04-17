class CreateCasinos < ActiveRecord::Migration[5.2]
  def change
    create_table :casinos do |t|
      t.string :name

      t.timestamps
    end
  end
end
