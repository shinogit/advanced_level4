class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :book

  validates :comment, length: {maximum: 200, minimum: 1}

end
