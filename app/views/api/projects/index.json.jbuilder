json.array!(@projects) do |project|
	json.(project, :id, :title, :description, :year, :height, :width, :created_at, :updated_at)
	json.photo_url project.cover_photo
end
