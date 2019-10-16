class Post < ApplicationRecord
  validates :content, presence: true

  mount_uploader :video, VideoUploader

  belongs_to :user
	def user
  		return User.find_by(id: self.user_id)
  end  
end
