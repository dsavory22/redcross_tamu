class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :Member
      t.belongs_to :Shift
      t.integer :Hours, default: 0

      t.timestamps
    end
  end
end
