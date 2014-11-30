class Photo < ActiveRecord::Base
  include AttachAvatar
  include Croppable
  belongs_to :project
  
  def suggested_photo_based_on_size
    self.avatar.size < 30000 ? self.avatar.url(:auto_bg) : self.avatar.url(:medium)
  end
end
