# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# seeds for Fruits
Word.delete_all
fruits = [
  { name: 'Apple', level: 1},
  { name: 'Banana', level: 1},
  { name: 'Cherry', level: 1},
  { name: 'Grape', level: 1},
  { name: 'Grapefruit', level: 1},
  { name: 'Lemon', level: 1},
  { name: 'Melon', level: 1},
  { name: 'Orange', level: 1},
  { name: 'Peach', level: 1},
  { name: 'Pear', level: 2},
  { name: 'Pineapple', level: 1},
  { name: 'Strawberry', level: 1},
  { name: 'Watermelon', level: 2}
]
fruits.each do |fruit|
  Word.create!(name: fruit[:name], level: fruit[:level], group: 'Fruits')
end
