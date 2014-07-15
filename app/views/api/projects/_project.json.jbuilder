json.(project, :id, :title, :description, :year, :height, :width, :created_at, :updated_at)

media ||= nil
unless media.nil?
	json.media(media) do |medium|
		json.partial!("api/media/medium", :medium => medium)
	end
end

photos ||= nil
unless photos.nil?
	json.photos(photos) do |photo|
		json.partial!("api/photos/photo", :photo => photo)
	end
end