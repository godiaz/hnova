class Project < ApplicationRecord
  has_many_attached :images

  attr_accessor :remove_image

  after_save :purge_images, if: :remove_image
  private def purge_images
    images.purge_later
  end

end
