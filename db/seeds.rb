# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(birth_date: '1989/08/31', color: 'orange', name: 'fluff', sex: 'M', description: "best cat")
Cat.create!(birth_date: '2014/08/31', color: 'black', name: 'mitts', sex: 'M', description: "kinda good cat")
Cat.create!(birth_date: '2001/12/04', color: 'brown', name: 'mr brown', sex: 'F')
Cat.create!(birth_date: '2012/07/19', color: 'white', name: 'snowball', sex: 'F', description: "snobby cat")
Cat.create!(birth_date: '1989/11/29', color: 'orange', name: 'pumpkin', sex: 'F')
Cat.create!(birth_date: '2016/08/31', color: 'brown', name: 'charlie', sex: 'M', description: "plays fetch")
