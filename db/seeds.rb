# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cause.create(:cause_name => "WHO", :description => "Work health in world", :url => "www.who.com", :address => "New York")
Cause.create(:cause_name => "CRY", :description => "Work for food in Afrika", :url => "www.cry.com", :address => "New York")

