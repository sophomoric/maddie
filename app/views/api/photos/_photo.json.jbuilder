json.(photo, :id)

json.avatar_styles do
	json.thumb photo.avatar.url(:thumb)
	json.medium photo.avatar.url(:medium)
	json.full photo.avatar.url(:auto_bg)
	json.suggested_photo_based_on_size photo.suggested_photo_based_on_size
end