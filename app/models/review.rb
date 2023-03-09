class Review < ApplicationRecord
  belongs_to :list

  validates :comment, length: { minimum: 10 }
  validates :rating, numericality: { only_integer: true, in: (1..5)}
end
