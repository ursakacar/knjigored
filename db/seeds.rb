# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Inserting genres'

Genre.new(name: 'biografija').save!
Genre.new(name: 'drama').save!
Genre.new(name: 'fantazija').save!
Genre.new(name: 'kratka zgodba').save!
Genre.new(name: 'kriminalka').save!
Genre.new(name: 'ljubezenski roman').save!
Genre.new(name: 'mladinski roman').save!
Genre.new(name: 'modernistični roman').save!
Genre.new(name: 'pesmi').save!
Genre.new(name: 'potopis').save!
Genre.new(name: 'pravljica').save!
Genre.new(name: 'psihološki roman').save!
Genre.new(name: 'vojni roman').save!
Genre.new(name: 'zgodovinski roman').save!
