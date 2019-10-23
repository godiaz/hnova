class PostImagesController < ApplicationController
  respond_to :json

  def create
    image_params[:photo].open if image_params[:photo].tempfile.closed?

    @image = PostImage.new(params[:post_image].permit(:photo))

    respond_to do |format|
      if @image.save
        # binding.pry
        format.json { render json: { url: @image.photo_url }, status: :ok }
      else
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def image_params
    params.require(:post_image).permit(:photo)
  end
end
