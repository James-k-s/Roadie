class Chat < ApplicationRecord
  after_commit :set_user2, on: :create

  belongs_to :band, optional: true
  belongs_to :user1, class_name: 'User', foreign_key: 'user1_id'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2_id', optional: true
  has_many :messages

  private

  def set_user2
    if user2.nil?
      self.user2 = band.user
      save
    end
  end
end
