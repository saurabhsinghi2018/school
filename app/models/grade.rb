class Grade < ApplicationRecord
  has_and_belongs_to_many :sections
  validates :grade, uniqueness: true
  has_many :candidates
end
