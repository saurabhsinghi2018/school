class Candidate < ApplicationRecord

  has_one :payment
  belongs_to :user
  belongs_to :grade

  mount_uploader :passportsizephoto, ImageUploader

  mount_uploader :previousgrademarksheet , AttachmentUploader

  after_create :send_email

 def send_email
   UserMailer.new_registration(self.user).deliver
 end

end
