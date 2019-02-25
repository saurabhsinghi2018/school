class Candidate < ApplicationRecord

  has_one :payment
  belongs_to :user
  belongs_to :grade

  mount_uploader :passport_size_photo, ImageUploader

  mount_uploader :previous_grade_marksheet , AttachmentUploader

  mount_uploader :receipt , AttachmentUploader


  validates :contact_father,:contact_mother, numericality: true, format: { with: /\A[789]\d{9}\z/ }


  after_create :send_email

 def send_email
   UserMailer.new_registration(self.user).deliver
 end

end
