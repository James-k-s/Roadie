class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bands
  has_many :band_members
  has_many :songs, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :messages
  has_many :genres, dependent: :destroy
  has_many :instruments, dependent: :destroy
  has_many :applications, dependent: :destroy
end
