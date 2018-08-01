# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# create_table "flights", force: :cascade do |t|
#   t.integer "flight_num"
#   t.text "origin"
#   t.text "destination"
#   t.date "date"
#   t.integer "plane_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "planes", force: :cascade do |t|
#   t.string "name"
#   t.integer "rows"
#   t.integer "columns"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "reservations", force: :cascade do |t|
#   t.integer "user_id"
#   t.integer "flight_id"
#   t.integer "row"
#   t.string "column"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "users", force: :cascade do |t|
#   t.text "name"
#   t.boolean "admin"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false


User.destroy_all
u1 = User.create :name => "Shelley", :password => "chicken"
u2 = User.create :name => "Tom", :password => "chicken"
u3 = User.create :name => "Will", :password => "chicken"
u4 = User.create :name => "John", :password => "chicken"
u5 = User.create :name => "Joel", :password => "chicken"

puts "Created #{User.all.length} users."

Plane.destroy_all
p1 = Plane.create :name => "Qantas", :rows => 5, :columns => 4
p2 = Plane.create :name => "Jetstar", :rows => 10, :columns => 3

Flight.destroy_all
f1 = Flight.create :flight_num => "100", :origin => "Sydney", :destination => "Hong Kong", :date => '2017/12/24'
f2 = Flight.create :flight_num => "200", :origin => "Hong Kong", :destination => "Sydney", :date => '2017/12/25'
f3 = Flight.create :flight_num => "300", :origin => "Beijing", :destination => "New York", :date => '2017/12/24'
f4 = Flight.create :flight_num => "400", :origin => "Canberra", :destination => "Brisbane", :date => '2017/12/25'

Reservation.destroy_all

r1 = Reservation.create :seat => "A1"
r2 = Reservation.create :seat => "B2"
r3 = Reservation.create :seat => "C3"
r4 = Reservation.create :seat => "A4"

p1.flights << f1 << f2
p2.flights << f3 << f4

f1.reservations << r1
f2.reservations << r2
f3.reservations << r3
f4.reservations << r4

u1.reservations << r1 << r2
u2.reservations << r3 << r4
