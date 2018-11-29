class Section < ApplicationRecord
  belongs_to :user
  has_many :candidates,dependent: :destroy
  validates :section, uniqueness: { case_sensitive: false ,scope: :user_id}, on: :create,on: :update
end
