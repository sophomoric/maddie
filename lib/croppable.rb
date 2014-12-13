module Croppable
  def self.included(base)
    base.send(:attr_accessor, :crop_x, :crop_y, :crop_w, :crop_h)
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def reprocess_avatar
    puts "reprocessing avatar"
    avatar.reprocess!
  end
end