class Song < ApplicationRecord
  belongs_to :band, optional: true
  belongs_to :user, optional: true
  has_one_attached :song
end
