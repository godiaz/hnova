class PostImage < ApplicationRecord
  include ::PhotoUploader::Attachment.new(:photo)

end
