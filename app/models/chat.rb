class Chat < ApplicationRecord
  belongs_to :band, optional: true
  belongs_to :user1, class_name: 'User', foreign_key: 'user1_id'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2_id', optional: true
  has_many :messages
end
