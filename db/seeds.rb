# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tags = ["for sale", "not for sale", "sold"]

media = ["oil paint", "charcoal", "pencil", "acrylic"]

all_tags = tags + media

all_tags.each do |tag_name|
  Medium.create({:name => tag_name})
end

painting = Project.create({title: "A painting of a Duck", description: "Quack Quack Quack I say"})
painting.media = Medium.all