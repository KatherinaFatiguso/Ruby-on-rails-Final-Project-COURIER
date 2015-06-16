# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


customer1 = Customer.create!(
    first_name: 'Wayne',
    last_name: 'Marshall',
    company: 'Welding Pty',
    phone1: '02 9777 6666',
    phone2: '0404 444 998',
    email: 'wayne@mail.com',
    address: '200 Botany Road, Botany NSW 2019',
    comment: 'very happy customer'
  )

customer2 = Customer.create!(
  first_name: 'Anna',
  last_name: 'Anneta',
  company: 'Sweet Muffins Ltd',
  phone1: '02 9888 6666',
  phone2: '0404 333 998',
  email: 'anna@mail.com',
  address: '50 Anzac Parade, Kingsford NSW 2032',
  comment: 'good customer'
)

customer3 = Customer.create!(
  first_name: 'Peter',
  last_name: 'Broadbill',
  company: 'Concrete Man Ltd',
  phone1: '02 9333 6666',
  phone2: '0404 234 998',
  email: 'peter@mail.com',
  address: '2 Holt Steet, Surry Hills NSW 2010',
  comment: 'regular customer'
)

admin1 = User.create!(
  first_name: 'Jenny',
  last_name: 'Davies',
  email: 'jenny@mail.com',
  password: 'passwordjenny',
  password_confirmation: 'passwordjenny'
)
admin1.add_role :admin

admin2 = User.create!(
  first_name: 'Bill',
  last_name: 'Demov',
  email: 'bill@mail.com',
  password: 'passwordbill',
  password_confirmation: 'passwordbill'
)
admin2.add_role :admin

courier1 = User.create!(
  first_name: 'Paul',
  last_name: 'Bartlett',
  email: 'paul@mail.com',
  password: 'passwordpaul',
  password_confirmation: 'passwordpaul'
)
courier1.add_role :courier

courier2 = User.create!(
  first_name: 'Ruth',
  last_name: 'Rendell',
  email: 'ruth@mail.com',
  password: 'passwordruth',
  password_confirmation: 'passwordruth'
)
courier2.add_role :courier

task1 = Task.create!(
  from_address: "80 William Street, East Sydney NSW 2010",
  to_address: "51 Old Barrenjoey Road, Avalon NSW 2107",
  info: "Please leave at the backdoor. Thank you.",
  sign_required?: true,
  item_count: 1
)
task1.customer = customer1
task1.user = courier1
task1.save

task2 = Task.create!(
  from_address: "186 McElhone Street, Kings Cross NSW 2011",
  to_address: "27 Bennelong Road, Homebush Bay NSW 2127",
  info: "Please advise the Reception. Thank you.",
  sign_required?: true,
  item_count: 1
)
task2.customer = customer2
task2.user = courier2
task2.save

task3 = Task.create!(
  from_address: "255 Elizabeth Street, Sydney NSW 2000",
  to_address: "Shp 11/ Market Plz Bldg, Flemington Markets NSW 2129",
  info: "Please enter through the Loading Dock. Thank you.",
  item_count: 3
)
task3.customer = customer3
task3.user = courier1
task3.save

task4 = Task.create!(
  from_address: "255 Elizabeth Street, Sydney NSW 2000",
  to_address: "Shp 11/ Market Plz Bldg, Flemington Markets NSW 2129",
  info: "Please enter through the Loading Dock. Thank you.",
  item_count: 2
)
task4.customer = customer3
task4.user = courier1
task4.save

task5 = Task.create!(
  from_address: "4 Wilson Street, Harbord NSW 2096",
  to_address: "Alfred St (Cnr Loftus St), Circular Quay NSW 2000",
  info: "Please enter through the Loading Dock. Thank you.",
  item_count: 1
)
task5.customer = customer3
task5.user = courier2
task5.save


task6 = Task.create!(
  from_address: "48 Wilson Street, Harbord NSW 2096",
  to_address: "203 Botany Road, Alexandria NSW 2015",
  status: "incomplete",
  urgency: 2,
  info: "Please enter through the Loading Dock. Thank you.",
  start_time: '2015-06-10 10:00:00 am',
  end_time: '', # the parcel has never been sent
  sign_required?: true,
  signed?: false,
  item_count: 2
)
task6.customer = customer1
task6.user = courier1
task6.save


task7 = Task.create!(
  from_address: "Shop 5b/ 347 Kent Street, Sydney NSW 2000",
  to_address: "199 George St, Sydney NSW 2000",
  status: "incomplete",
  urgency: 3,
  info: "Please contact the Reception. Thank you.",
  start_time: '2015-06-12 10:00:00 am',
  end_time: '', # the parcel has never been sent
  sign_required?: true,
  signed?: false,
  item_count: 1
)
task7.customer = customer2
task7.user = courier2
task7.save


task8 = Task.create!(
  from_address: "1a/ 52 Martin Place, Sydney NSW 2000",
  to_address: "17 Menzies Arc, Sydney NSW 2000",
  status: "completed",
  urgency: 2,
  info: "Please ring the loading dock bell. Thank you.",
  start_time: '2015-06-13 10:00:00 am',
  end_time: '2015-06-14 11:00:00 am', # the parcel has never been sent
  sign_required?: true,
  signed?: true,
  item_count: 1
)
task8.customer = customer3
task8.user = courier1
task8.save


task9 = Task.create!(
  from_address: "199 George St, Sydney NSW 2000",
  to_address: "255 Elizabeth Street, Sydney NSW 2000",
  status: "completed",
  urgency: 1,
  info: "Please ring the loading dock bell. Thank you.",
  start_time: '2015-06-09 10:00:00 am',
  end_time: '2015-06-12 11:00:00 am', # the parcel has never been sent
  sign_required?: true,
  signed?: true,
  item_count: 1
)
task9.customer = customer2
task9.user = courier2
task9.save


task10 = Task.create!(
  from_address: "4 Wilson Street, Harbord NSW 2096",
  to_address: "27 Bennelong Road, Homebush Bay NSW 2127",
  status: "archived",
  urgency: 1,
  info: "Please ring the loading dock bell. Thank you.",
  start_time: '2015-05-09 10:00:00 am',
  end_time: '2015-05-12 11:00:00 am', # the parcel has never been sent
  sign_required?: true,
  signed?: true,
  item_count: 1
)
task10.customer = customer2
task10.user = courier2
task10.save