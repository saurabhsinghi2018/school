class Candidate < ApplicationRecord

  has_one :payment
  belongs_to :user
  belongs_to :grade

  mount_uploader :passport_size_photo, ImageUploader

  mount_uploader :previous_grade_marksheet , AttachmentUploader

  after_create :send_email

 def send_email
   UserMailer.new_registration(self.user).deliver
 end

end
