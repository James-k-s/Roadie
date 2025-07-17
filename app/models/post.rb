class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :band, optional: true
  has_one_attached :photo
end
