class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy, optional: true
  belongs_to :band, dependent: :destroy, optional: true
end
