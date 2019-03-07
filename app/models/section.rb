class Section < ApplicationRecord
  has_and_belongs_to_many :grades
  validates :section, uniqueness: true
  has_many :candidates
  before_save :upcase_fields

   def upcase_fields
      self.section.upcase!
   end
end
