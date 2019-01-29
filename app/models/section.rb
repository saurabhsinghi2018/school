class Section < ApplicationRecord
  has_many :grades,dependent: :destroy
  validates :section, uniqueness: true, on: :create

  before_save :upcase_fields

   def upcase_fields
      self.section.upcase!
   end
end
