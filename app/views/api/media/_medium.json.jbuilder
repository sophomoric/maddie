json.(medium, :id, :name, :description, :avatar, :created_at, :updated_at)

json.avatar_styles do
	json.thumb medium.avatar.url(:thumb)
	
end

projects ||= nil
unless projects.nil?
	json.projects(projects) do |project|
		json.partial!("api/projects/project", :project => project)
	end
end