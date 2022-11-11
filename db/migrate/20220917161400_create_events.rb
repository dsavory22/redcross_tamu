class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :Type
      t.date :Date
      t.string :Name
      t.time :Start
      t.time :End
      t.timestamps
    end
  end
end
