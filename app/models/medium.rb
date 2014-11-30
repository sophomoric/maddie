class Medium < ActiveRecord::Base
  include AttachAvatar
  include Croppable
  has_and_belongs_to_many :projects
end
