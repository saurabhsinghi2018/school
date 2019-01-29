class Grade < ApplicationRecord
  belongs_to :section
  has_many :candidates,dependent: :destroy
  validates :grade, uniqueness:{ case_sensitive: false ,scope: :section_id}, on: :create


end
