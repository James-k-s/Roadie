class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end


  def calendar
    @events = Event.all
  end


end
