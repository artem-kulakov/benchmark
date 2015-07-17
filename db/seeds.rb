# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Report.delete_all

Report.create!([
  {company: 'Gazprom', period: 2014, revenues: 123_000, industry: 'Oil and gas'},
  {company: 'Lukoil',  period: 2013, revenues: 99_000, industry: 'Oil and gas'},
  {company: 'Rosneft', period: 2012, revenues: 101_000, industry: 'Oil and gas'},
  {company: 'Novatek', period: 2011, revenues: 55_000, industry: 'Oil and gas'}
])