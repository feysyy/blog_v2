class Comment < ApplicationRecord
  validates :body, presence: true, length: {minimum: 5, maximum: 500}

end
