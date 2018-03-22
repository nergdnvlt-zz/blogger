# Model level comment for class
class Article < ApplicationRecord
  validates_presence_of :title, :body
end
