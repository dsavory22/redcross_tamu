class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :Member
      t.belongs_to :Shift
      t.integer :Hours
      t.time :Start
      t.time :End

      t.timestamps
    end
  end
end
