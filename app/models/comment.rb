# frozen_string_literal: true

class Comment < ApplicationRecord
  acts_as_votable
  belongs_to :person
  belongs_to :article
end
