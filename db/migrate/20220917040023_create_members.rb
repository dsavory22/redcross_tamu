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
 #     t.integer :officer #2 is highest value, #1 regular event maker #0 for regular user

      t.timestamps
    end
  end
end
