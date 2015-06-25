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
  phone1: '0404 222 004',
  phone2: '02 9922 8888',
  address: '26 Railway St, Hurlstone Park NSW 2193',
  email: 'jenny@mail.com',
  password: 'passwordjenny',
  password_confirmation: 'passwordjenny'
)
admin1.add_role :admin

admin2 = User.create!(
  first_name: 'Bill',
  last_name: 'Demov',
  phone1: '0404 000 004',
  phone2: '02 9999 8888',
  address: '192 Parramatta Rd, Stanmore NSW 2048',
  email: 'bill@mail.com',
  password: 'passwordbill',
  password_confirmation: 'passwordbill'
)
admin2.add_role :admin

courier1 = User.create!(
  first_name: 'Paul',
  last_name: 'Bartlett',
  phone1: '0404 111 004',
  phone2: '02 9911 8888',
  address: '36 Pembroke St, Ashfield NSW 2131',
  email: 'paul@mail.com',
  password: 'passwordpaul',
  password_confirmation: 'passwordpaul'
)
courier1.add_role :courier

courier2 = User.create!(
  first_name: 'Ruth',
  last_name: 'Rendell',
  phone1: '0404 111 004',
  phone2: '02 9911 8888',
  address: '7 Waters Rd, Neutral Bay NSW 2089',
  email: 'ruth@mail.com',
  password: 'passwordruth',
  password_confirmation: 'passwordruth'
)
courier2.add_role :courier

task1 = Task.create!(
  customer_id: customer1.id,
  sender: "Laura George",
  from_address: "80 William Street, East Sydney NSW 2010",
  receiver: "Martin Broadbill",
  to_address: "51 Old Barrenjoey Road, Avalon NSW 2107",
  info: "Please leave at the backdoor. Thank you.",
  sign_required: true,
  item_count: 1
)

task2 = Task.create!(
  customer_id: customer2.id,
  sender: "Maria Pirrotina",
  from_address: "186 McElhone Street, Kings Cross NSW 2011",
  receiver: "Jesse Alban",
  to_address: "27 Bennelong Road, Homebush Bay NSW 2127",
  info: "Please advise the Reception. Thank you.",
  sign_required: true,
  item_count: 1
)

task3 = Task.create!(
  customer_id: customer3.id,
  sender: "Donna Karan",
  from_address: "40 Lucy St, Ashfield NSW 2131",
  receiver: "Murray Mayne",
  to_address: "280 Pitt St, Sydney NSW 2000",
  info: "Please enter through the Loading Dock. Thank you.",
  item_count: 3
)

task4 = Task.create!(
  customer_id: customer3.id,
  sender: "Karen Martina",
  from_address: "255 Elizabeth Street, Sydney NSW 2000",
  receiver: "Jimmy Lane",
  to_address: "199 George St, Sydney NSW 2000",
  info: "Please enter through the Loading Dock. Thank you.",
  item_count: 2
)

task5 = Task.create!(
  customer_id: customer3.id,
  sender: "Mary Poppler",
  from_address: "1 Rothschild Ave, Rosebery NSW 2018",
  receiver: "Peter Sanders",
  to_address: "255 Pitt St, Sydney NSW 2000",
  info: "Please enter through the Loading Dock. Thank you.",
  item_count: 1
)

task6 = Task.create!(
  customer_id: customer1.id,
  user_id: courier1.id,
  sender: "Jonathan Anton",
  from_address: "7 Henry Street, Parramatta NSW 2150",
  receiver: "Mary William",
  to_address: "203 Botany Road, Alexandria NSW 2015",
  status: "incomplete",
  info: "Please report to the Reception. Thank you.",
  accepted_time: '2015-06-10 10:00:00 am',
  accomplished_time: '', # the parcel has never been sent
  sign_required: true,
  signed: false,
  item_count: 2
)

task7 = Task.create!(
  customer_id: customer2.id,
  user_id: courier2.id,
  sender: "Jacob Marc",
  from_address: "347 Kent Street, Sydney NSW 2000",
  receiver: "William Marshall",
  to_address: "199 George St, Sydney NSW 2000",
  status: "incomplete",
  info: "Please contact the Reception. Thank you.",
  accepted_time: '2015-06-12 10:00:00 am',
  accomplished_time: '', # the parcel has never been sent
  sign_required: true,
  signed: false,
  item_count: 1
)

task8 = Task.create!(
  customer_id: customer3.id,
  sender: "Peter Roger",
  from_address: "52 Martin Place, Sydney NSW 2000",
  receiver: "Maria Martina",
  to_address: "17 Menzies Arc, Sydney NSW 2000",
  status: "completed",
  info: "Please ring the loading dock bell. Thank you.",
  accepted_time: '2015-06-13 10:00:00 am',
  accomplished_time: '2015-06-14 11:00:00 am', # the parcel was sent successfully
  sign_required: true,
  signed: true,
  item_count: 1
)

task9 = Task.create!(
  customer_id: customer2.id,
  sender: "Anne Murray",
  from_address: "199 George St, Sydney NSW 2000",
  receiver: "Steve Pirrotina",
  to_address: "255 Elizabeth Street, Sydney NSW 2000",
  status: "completed",
  info: "Please ring the loading dock bell. Thank you.",
  accepted_time: '2015-06-09 10:00:00 am',
  accomplished_time: '2015-06-12 11:00:00 am', # the parcel was sent successfully
  sign_required: true,
  signed: true,
  item_count: 1
)

task10 = Task.create!(
  customer_id: customer2.id,
  sender: "Mary Wilson",
  from_address: "65 Meeks St, Kingsford NSW 2032",
  receiver: "Jim Sanders",
  to_address: "38 Hunter Street, Hornsby NSW 2077",
  status: "archived",
  info: "Please ring the loading dock bell. Thank you.",
  accepted_time: '2015-05-09 10:00:00 am',
  accomplished_time: '2015-05-12 11:00:00 am', # the parcel was sent successfully
  sign_required: true,
  signed: true,
  item_count: 1
)
