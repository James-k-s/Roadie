class AlbumsController < ApplicationController
  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id

    if @album.save!
      redirect_to inspiration_path, notice: "Album cover successfully created."
    else
      redirect_to root_path, alert: "Failed to create Album cover. Please try again."
    end

  end

  def album_params
    params.require(:album).permit(:name, :prompt)
  end

  def show
    @album = Album.find(params[:id])
  end

end
