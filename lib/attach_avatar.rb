module AttachAvatar
  def self.included(base)
    base.before_validation :make_url_image
    base.has_attached_file :avatar,
                      :styles => {
                                  :medium => "300x300>",
                                  :thumb => "100x100>",
                                  :auto_bg => "auto_bg"
                                  }
    base.validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    base.validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /PNG\Z/, /JPE?G\Z/]
  end

  def make_url_image
    if self.avatar.class == String
      self.avatar = open(self.avatar, allow_redirections: :safe)
    end
  end
end
