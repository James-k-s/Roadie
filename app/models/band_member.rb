class BandMember < ApplicationRecord
  belongs_to :band
  belongs_to :user
  has_one :instrument
  has_many :events
end
