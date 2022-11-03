# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
member1 = Member.create(First_Name: 'Gracie', Last_Name: 'Woodland', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Alyssa', Last_Name: 'Earle', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Annabella', Last_Name: 'Calvert', Email: nil, Fall_Dues: true, Spring_Dues: false, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Hailey', Last_Name: 'Bridgeford', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Sarayu', Last_Name: 'Malireddy', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Cheyann', Last_Name: 'Lopez', Email: nil, Fall_Dues: true, Spring_Dues: false, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Bilal', Last_Name: 'Hassan', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Lali', Last_Name: 'Sanchez', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Elida', Last_Name: 'Arreola', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Kate', Last_Name: 'Ng', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Emily', Last_Name: 'Johnston', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Michelle', Last_Name: 'Le', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Vicky', Last_Name: 'Le', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Kevan', Last_Name: 'Vora', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Kristen', Last_Name: 'Hernandez', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Lorena', Last_Name: 'Fernandez', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Shoaib', Last_Name: 'Daudjee', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: nil)

Member.create(First_Name: 'Elizabeth', Last_Name: 'asdfoi;', Role: 4 , Email: 'juanchavez@tamu.edu', Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: nil )


Member.create(First_Name: 'Elizabeth', Last_Name: 'asdfoi;',Role: 4 , Email: 'daniel.savory@tamu.edu', Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: nil, )

Event.create(Type: 0, Date:"2021-09-25", Name: "Meeting 1")

Event.create(Type: 0, Date:"2021-09-30", Name: "Meeting 2")

Event.create(Type: 0, Date:"2021-10-23", Name: "Meeting 3")

Event.create(Type: 0, Date:"2021-11-13", Name: "Meeting 4")

Event.create(Type: 0, Date:"2021-11-13", Name: "Meeting 4")

Event.create(Type: 1, Date:"2021-09-25", Name: "ReStore", Start:"12:00", End: "16:00")

Event.create(Type: 1, Date:"2021-09-30", Name: "Blood Drive", Start:"0:00", End: "12:00")

Event.create(Type: 1, Date:"2021-10-07", Name: "Skating Social", Start:"12:00", End: "14:00")

Event.create(Type: 1, Date:"2021-10-16", Name: "ReStore", Start:"12:00", End: "14:00")

Event.create(Type: 1, Date:"2021-10-21", Name: "Missing Maps", Start:"12:00", End: "16:00")

Event.create(Type: 1, Date:"2021-10-28", Name: "Study Social", Start:"12:00", End: "16:00")

Event.create(Type: 1, Date:"2021-09-25", Name: "Boba Social", Start:"12:00", End: "14:00")

Event.create(Type: 1, Date:"2021-11-13", Name: "Missing Maps", Start:"12:00", End: "16:00")

Budget.create(Total_amount: 0)