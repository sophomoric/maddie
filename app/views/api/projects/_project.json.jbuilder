json.(project, :id, :title, :description, :year, :height, :width, :created_at, :updated_at)

json.media(media) do |medium|
	json.partial!("media/medium", medium)
end