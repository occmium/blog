class Comment < ApplicationRecord
  belongs_to :person
  belongs_to :article
end
