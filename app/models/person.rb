class Person < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :email, uniqueness: true
end
