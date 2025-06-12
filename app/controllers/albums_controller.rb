class AlbumsController < ApplicationController
  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id

    @band = Band.find(params[:band_id])

    @album.band = @band
    if @album.save!
      redirect_to band_path(@band), notice: "Your album is being created, this could take a second."
    else
      redirect_to band_path(@band), alert: "Failed to create Album cover. Please try again."
    end
  end

  def album_params
    params.require(:album).permit(:name, :prompt)
  end

  def show
    @album = Album.find(params[:id])
  end
end
