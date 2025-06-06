class VacanciesController < ApplicationController
  def create
    @vacancy = Vacancy.create(vacancy_params)
    @vacancy.band = Band.find(params[:band_id])
    if @vacancy.save
      redirect_to band_path(@vacancy.band), notice: "Vacancy created successfully."
    else
      redirect_to root_path, alert: "Failed to create vacancy. Please try again."
    end
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :description, :instrument, :years_of_experience, :availability, :confidence)
  end
end
