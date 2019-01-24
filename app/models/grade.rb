class Grade < ApplicationRecord
  belongs_to :section
  has_many :candidates,dependent: :destroy

end
