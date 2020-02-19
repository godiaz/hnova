class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  paginates_per 10

  attr_accessor :remove_image

  after_save :purge_image, if: :remove_image
  private def purge_image
    image.purge_later
  end

end
