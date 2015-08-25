class Medium < ActiveRecord::Base
  include AttachAvatar
  include Croppable

  belongs_to :user
  has_and_belongs_to_many :projects
end
