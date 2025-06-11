class Band < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  has_many :band_members, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :notifications
  has_many :chats
  has_many :vacancies, dependent: :destroy
  has_many :projects, dependent: :destroy
  belongs_to :user
  has_many :applications, through: :vacancies

  has_many :events, dependent: :destroy


  def member?(user)
    band_members.exists?(user: user)
  end

end
