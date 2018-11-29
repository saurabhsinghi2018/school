class Candidate < ApplicationRecord

  has_one :payment
  belongs_to :section
  belongs_to :user

  validates :candidatename,  uniqueness: { case_sensitive: false ,scope: :section_id}, on: :create

  mount_uploader :passportsizephoto, ImageUploader

  mount_uploader :previousgrademarksheet , AttachmentUploader

  after_create :send_email

 def send_email
   UserMailer.new_registration(self.user).deliver
 end

end
