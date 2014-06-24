# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dog.create(name: 'Riva', breed: 'Golden Retriever', age: '2', user_id: 1)
Dog.create(name: 'Lucy', breed: 'mix', age: '3', user_id: 2)
Dog.create(name: 'Riley', breed: 'mix', age: '5', user_id: 3)
Dog.create(name: 'Mays', breed: 'goldendoodle', age: '1', user_id: 4)

Park.create(name: 'McLaren Park', street_address: 'Shelly Dr. & Mansell St.', yelp_id: 'john-mclaren-park-san-francisco')
Park.create(name: 'Crissy Field', street_address: 'Mason Street', yelp_id: 'crissy-field-san-francisco')
Park.create(name: 'Ocean Beach', street_address: 'Great Highway at Sloat', yelp_id: 'ocean-beach-san-francisco')
Park.create(name: 'Corona Heights', street_address: 'Randall Field at Museum Way & Roosevelt Way', yelp_id: 'corona-heights-park-san-francisco')
Park.create(name: 'Buena Vista Park', street_address: 'Buena Vista West and Central St.', yelp_id: 'buena-vista-park-san-francisco')
Park.create(name: 'Fort Funston', street_address: 'Skyline & Fort Funston', yelp_id: 'fort-funston-san-francisco-3')