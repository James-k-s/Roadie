class Chat < ApplicationRecord
  belongs_to :band, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
