class Application < ApplicationRecord
  belongs_to :vacancy
  belongs_to :user
end
