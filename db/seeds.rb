# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ut = UserType.create([{ name: 'customer', metric: 1 }, { name: 'supplier', metric: 10 }, { name: 'admin', metric: 100 }])
os = OrderStatus.create([{ name: 'New' }, { name: 'Cancelled' }, { name: 'Processing' }, { name: 'Shipped' }, { name: 'Delivered' }])
