json.(photo, :id)

json.avatar_styles do
	json.thumb photo.avatar.url(:thumb)
	json.medium photo.avatar.url(:medium)
	json.full photo.avatar.url(:auto_bg)
end