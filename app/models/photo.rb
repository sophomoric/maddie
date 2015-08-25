class Photo < ActiveRecord::Base
  include AttachAvatar
  include Croppable
  belongs_to :project
  has_one :user, through: :project

  def suggested_photo_based_on_size
    if self.avatar.size < 30000
      self.avatar.url(:auto_bg)
    else
      self.avatar.url(:medium)
    end
  end
end
