class View::DisplayPhoto
  def initialize(project)
    @project = project
  end

  def url(id=nil)
    if id.present?
      photo = Photo.find(id)
      photo.avatar.url(:medium)
    else
      @project.avatar.url(:medium)
    end
  end
end
