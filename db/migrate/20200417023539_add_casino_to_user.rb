class AddCasinoToUser < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def change
    add_reference :users, :casino, index: {algorithm: :concurrently}
  end
end
