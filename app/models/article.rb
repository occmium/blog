# frozen_string_literal: true

class Article < ApplicationRecord
  acts_as_votable
  belongs_to :person
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
end
