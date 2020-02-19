class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  paginates_per 10
  extend FriendlyId
  friendly_id :post_sanitize, use: :slugged

  attr_accessor :remove_image

  after_save :purge_image, if: :remove_image

  def post_sanitize
    title.gsub("<div>","").gsub("</div>","").gsub(" ","-").gsub(".","")
  end
  private

  def purge_image
    image.purge_later
  end


end
