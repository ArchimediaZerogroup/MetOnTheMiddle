# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if Person.count==0
  Person.create(
      [
          {name: 'Marino', surname: 'Bonetti'},
          {name: 'Marino3', surname: 'Bonetti2'},
          {name: 'Marino4', surname: 'Bonetti3'},
          {name: 'Marino5', surname: 'Bonetti4'}
      ]
  )
end