class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  has_many :bands, dependent: :destroy
  has_many :band_members, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :messages
  has_many :user_genres, dependent: :destroy
  has_many :genres, through: :user_genres
  has_many :instruments, dependent: :destroy
  has_many :applications, dependent: :destroy
end
