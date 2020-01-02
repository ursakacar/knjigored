class Book < ApplicationRecord
  belongs_to :genre, optional: true
  belongs_to :author

  validates :title, :internal_number, presence: true
  validates :internal_number, numericality: { only_integer: true }
  validates :internal_number, uniqueness: true
end
