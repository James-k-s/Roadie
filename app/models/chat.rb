class Chat < ApplicationRecord
  belongs_to :band, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_many :messages, dependent: :destroy
end
