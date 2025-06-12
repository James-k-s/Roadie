require "open-uri"

class Album < ApplicationRecord
  belongs_to :user
  belongs_to :band
  has_one_attached :photo

  after_save if: -> { saved_change_to_name? } do
    set_photo
  end

  private

  def set_photo
    AlbumJob.perform_later(self)
  end


end
