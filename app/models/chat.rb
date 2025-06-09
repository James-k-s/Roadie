class Chat < ApplicationRecord
  belongs_to :band
  belongs_to :user
  has_many :messages
end
