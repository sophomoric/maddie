class Photo < ActiveRecord::Base
  include AttachAvatar
  belongs_to :project
  


  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_avatar, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  

  
  def suggested_photo_based_on_size
    self.avatar.size < 30000 ? self.avatar.url(:auto_bg) : self.avatar.url(:medium)
  end
  
  private
  
  def reprocess_avatar
    puts "reprocessing avatar"
    avatar.reprocess!
  end 
end
