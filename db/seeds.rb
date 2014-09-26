require_relative '../config/environment'

STUDENT_NAMES = ["Alan Cohen",
"Alan Florendo",
"Alexander Le",
"Alexei Pesic",
"Audrey McGowan",
"Avi Fox-Rosen",
"Bruno Pasini",
"Chase Blokker",
"David Bragdon",
"Derek Johnson",
"Edward Kim",
"Eric Shemtov",
"Garrett Dalton",
"George Zeng",
"John Berry",
"Joseph White",
"Justin Lee",
"Justin Wagner",
"Kimberly Brewer",
"Max Lock",
"Ryan Storberg",
"Stephen Craig Estrada",
"Yariv Kirschner"]
 

STUDENT_NAMES.each do |name|
  User.create(fullname: name, cohort_id: 3) 
end

