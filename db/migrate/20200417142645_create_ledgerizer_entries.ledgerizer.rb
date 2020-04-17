# This migration comes from ledgerizer (originally 20190829194605)
class CreateLedgerizerEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :ledgerizer_entries do |t|
      t.references :tenant, polymorphic: true
      t.string :code
      t.references :document, polymorphic: true
      t.date :entry_date

      t.timestamps
    end
  end
end
