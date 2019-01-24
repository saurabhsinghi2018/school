class Candidate < ApplicationRecord

  has_one :payment
  belongs_to :user
  belongs_to :grade

  before_save :upcase_fields

   def upcase_fields
      self.applicationstatus.upcase!
   end

   def upcase_fields
      self.payment_status.upcase!
   end

  mount_uploader :passportsizephoto, ImageUploader

  mount_uploader :previousgrademarksheet , AttachmentUploader

  after_create :send_email

 def send_email
   UserMailer.new_registration(self.user).deliver
 end

end
