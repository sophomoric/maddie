def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/#{file_name}"))
end

Medium.destroy_all

tags = ["for sale", "not for sale", "sold"]

media = ["charcoal", "metal", "oil paint", "pencil"]

avatar = ["charcoal.jpg", "metal.jpg", "oilpaint.jpg", "pencil.jpg", "bagelbighter.jpg", "bagelbighter.jpg", "bagelbighter.jpg"]

all_tags = media + tags

all_tags.count.times do |number|
  Medium.create({:name => all_tags[number], :avatar => seed_image(avatar[number])})
end

# Medium.create(name: "rails pic test", avatar: File.open("/Users/adriancann/Downloads/solutions-master/w7/w7d1/phototaggr/app/assets/images/rails.png"))
#seed in production
