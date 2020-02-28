class Article < ApplicationRecord
  belongs_to :person
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
end
