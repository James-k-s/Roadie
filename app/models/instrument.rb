class Instrument < ApplicationRecord
  belongs_to :user
  belongs_to :band_member
end
