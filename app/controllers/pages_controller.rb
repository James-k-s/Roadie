class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
  end

  def about
  end

  def calendar
    @events = Event.all
  end
end
