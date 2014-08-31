# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/#{file_name}"))
end

tags = ["for sale", "not for sale", "sold"]

media = ["charcoal", "metal", "oil paint", "pencil"]

avatar = ["charcoal.jpg", "metal.jpg", "oilpaint.jpg", "pencil.jpg", "bagelbighter.jpg", "bagelbighter.jpg", "bagelbighter.jpg"]

all_tags = media + tags

all_tags.count.times do |number|
  Medium.create({:name => all_tags[number], :avatar => seed_image(avatar[number])})
end

painting = Project.create({title: "A painting of a Duck", description: "Quack Quack Quack I say", year: 2000, height: 10, width: 10})
painting.media = Medium.all

other = Project.create({title: "A painting of Chicken", description: "BRAWK BRAWK I say", year: 2001, height: 20, width: 10})
other.media = Medium.all

# Medium.create(name: "rails pic test", avatar: File.open("/Users/adriancann/Downloads/solutions-master/w7/w7d1/phototaggr/app/assets/images/rails.png"))
#seed in production