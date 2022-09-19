class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.decimal :Total_amount, precision: 8, scale: 2
      t.date :Date

      t.timestamps
    end
  end
end
