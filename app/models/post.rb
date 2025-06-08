class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :band, dependent: :destroy, optional: true
end
