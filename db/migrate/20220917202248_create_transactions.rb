class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :Budget
      t.decimal :Amount, precision: 8, scale: 2
      t.date :Date

      t.timestamps
    end
  end
end
