class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :Budget
      t.string :Purpose
      t.decimal :Amount, precision: 8, scale: 2
      t.string :Officer
      t.decimal :Total, precision: 8, scale: 2
      t.date :Date
      t.timestamps
    end
  end
end
