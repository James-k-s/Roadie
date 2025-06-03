class Vacancy < ApplicationRecord
  belongs_to :band
  has_many :applications, dependent: :destroy
end
