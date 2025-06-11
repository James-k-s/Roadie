class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :band, optional: true
  belongs_to :user1, class_name: 'User', foreign_key: 'user1_id'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2_id', optional: true
  has_one_attached :photo

  enum status: { meeting: 0, gig: 1, practice: 2, tour: 3 }
end
