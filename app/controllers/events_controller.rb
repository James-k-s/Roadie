class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    @event.user1 = current_user
    @event.band = current_user.bands.first
    if @event.save
      redirect_to band_path(@event.band), notice: "Event created successfully."
    else
      redirect_to root_path, alert: "Failed to create event. Please try again."
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time, :end_time, :address, :status)
  end
end
