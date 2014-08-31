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

Photo.destroy_all
Project.destroy_all
def seed_image(subfolder, file_name)
  File.open(File.join(Rails.root, "/app/assets/images/ArtPortfolio/Adrian/" + subfolder + "/#{file_name}"))
end

Dir.entries("app/assets/images/ArtPortfolio/Adrian").each do |entry|
  next if entry[0] == "."
  project = Project.create({title: entry, description: "blah blah this is art. you should probably change the default description"})
  Dir.entries("app/assets/images/ArtPortfolio/Adrian" + "/" + entry).each do |picture|
    next if picture[0] == "."
    photo = project.photos.new(avatar: seed_image(entry, picture))
    photo.save
  end
end