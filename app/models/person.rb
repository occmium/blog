class Person < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates :email, uniqueness: true
  validates :name, presence: true
  validate :avatar_size

  private

  def avatar_size
    errors.add(:avatar, 'slould be less than 2MB') if avatar.size > 2.megabytes
  end
end
