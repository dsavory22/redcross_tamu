# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
member1 = Member.create(First_Name: 'Gracie', Last_Name: 'Woodland', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Alyssa', Last_Name: 'Earle', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Annabella', Last_Name: 'Calvert', Email: nil, Fall_Dues: true, Spring_Dues: false, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Hailey', Last_Name: 'Bridgeford', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Sarayu', Last_Name: 'Malireddy', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Cheyann', Last_Name: 'Lopez', Email: nil, Fall_Dues: true, Spring_Dues: false, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Bilal', Last_Name: 'Hassan', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Lali', Last_Name: 'Sanchez', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Elida', Last_Name: 'Arreola', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Kate', Last_Name: 'Ng', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Emily', Last_Name: 'Johnston', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Michelle', Last_Name: 'Le', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Vicky', Last_Name: 'Le', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Kevan', Last_Name: 'Vora', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Kristen', Last_Name: 'Hernandez', Email: nil, Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Lorena', Last_Name: 'Fernandez', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Shoaib', Last_Name: 'Daudjee', Email: nil, Fall_Dues: true, Spring_Dues: true, Shirt_Size: nil, year: 6)

Member.create(First_Name: 'Aaron', Last_Name: 'Calderon', Role: 6 , Email: 'aaron54637@tamu.edu', Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 4)
Member.create(First_Name: 'Daniel', Last_Name: 'Savory', Role: 6 , Email: 'daniel.savory@tamu.edu', Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 4)
Member.create(First_Name: 'Chase', Last_Name: 'Cason', Role: 6 , Email: 'chasecason@tamu.edu', Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 4)
Member.create(First_Name: 'Layla', Last_Name: 'Wilkinson', Role: 6 , Email: 'leilaniwilkinson@tamu.edu', Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 4)
Member.create(First_Name: 'Dylan', Last_Name: 'Craven', Role: 6 , Email: 'dylan.craven@tamu.edu', Fall_Dues: false, Spring_Dues: false, Shirt_Size: nil, year: 4)

Budget.create(Total_amount: 0)