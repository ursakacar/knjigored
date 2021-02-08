class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  before_save :strip_name

  private
    def strip_name
      self.name = self.name.strip
    end

end
