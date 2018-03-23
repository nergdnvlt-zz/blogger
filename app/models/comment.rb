# Model level comment for comment class
class Comment < ApplicationRecord
  belongs_to :article
end
