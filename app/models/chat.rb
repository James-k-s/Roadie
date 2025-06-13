class Chat < ApplicationRecord
  belongs_to :band, optional: true
  belongs_to :user1, class_name: 'User', foreign_key: 'user1_id'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2_id', optional: true
  has_many :messages

  before_validation :set_user2, on: :create

  validate :users_cannot_be_the_same

  def users_cannot_be_the_same
    errors.add(:user2, "can't be the same as user1") if user1_id == user2_id
  end

  private

  def set_user2
    if user2.nil? && band.present? && band.user.present?
      self.user2 = band.user
    end
  end

  def users_cannot_be_the_same
    errors.add(:user2, "can't be the same as user1") if user1_id == user2_id
  end
end
