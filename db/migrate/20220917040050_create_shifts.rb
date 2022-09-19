class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.belongs_to :Event
      t.datetime :Start
      t.datetime :End
      t.integer :Shift_Cap
      t.timestamps
    end
  end
end
