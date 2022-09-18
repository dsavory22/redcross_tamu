class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :First_Name
      t.string :Last_Name
      t.string :Email
      t.boolean :Fall_Dues
      t.boolean :Spring_Dues
      t.string :Shirt_Size
      t.integer :year

      t.timestamps
    end
  end
end
