class Content < ApplicationRecord
  mount_uploader :video, VideoUploader
end
