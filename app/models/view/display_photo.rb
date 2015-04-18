class View::DisplayPhoto
  include Rails.application.routes.url_helpers
  def initialize(project, params)
    @project = project
    @params = params
  end

  def main_photo
    size = @params[:size] || :medium
    id = @params[:photo_id]
    if id.present?
      photo = Photo.find(id)
      photo.avatar(size)
    else
      @project.avatar(size)
    end
  end

  def photos
    @project.photos
  end

  def photo_url(photo)
    "#{project_url(@project)}/photos/#{photo.id}"
  end
end
