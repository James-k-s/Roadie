class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
  end

  def about
  end


  def calendar
    @events = Event.all
  end

  def inspiration
    @albums = Album.all
    @album = Album.new
    @user = current_user
  end
end
