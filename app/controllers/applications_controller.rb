class ApplicationsController < ApplicationController
  def create
    @application = Application.new(application_params)
    @application.user = current_user
    @application.vacancy_id = params[:vacancy_id]
    if @application.save
      redirect_to band_path(@application.vacancy.band), notice: "Application submitted successfully."
    else
      redirect_to band_path(@application.vacancy.band), alert: "Failed to submit application. Please try again."
    end
  end

  private

  def application_params
    params.require(:application).permit(:pitch)
  end
end
