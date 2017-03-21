# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Hierarchy.create(name: 'SuperAdmin', level: 0)
Hierarchy.create(name: 'Admin', level: 1)
Hierarchy.create(name: 'CEO', level: 2)
Hierarchy.create(name: 'Director', level: 3)
Hierarchy.create(name: 'Manager', level: 4)
Hierarchy.create(name: 'SeniorManager', level: 5)
Hierarchy.create(name: 'External', level: 6)
