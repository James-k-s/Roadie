class SongsController < ApplicationController
  def create
    @song = Song.create(song_params)
    @band = Band.find_by(id: params[:band_id])
    if @band
      @song.band = @band
      if @song.save!
        redirect_to band_path(@band), notice: "Song successfully added."
      else
        redirect_to root_path, alert: "Failed to add song. Please try again."
      end
    else
      @song.user = current_user
      if @song.save!
        redirect_to user_path(@song.user), notice: "Song successfully added."
      else
        redirect_to root_path, alert: "Failed to add song. Please try again."
      end
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :song)
  end
end
