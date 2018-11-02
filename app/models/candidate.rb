class Candidate < ApplicationRecord

  belongs_to :user
  has_one :payment

  CLASS_LIST = ['KINDERGARDEN SECTION', 'CLASS 1', 'CLASS 2' ,'CLASS 3', 'CLASS 4', "CLASS 5 (BOY'S)" , "CLASS 5 (GIRL'S)" , "CLASS 6 (BOY'S)" , "CLASS 6 (GIRL'S)" ,"CLASS 7 (BOY'S)" , "CLASS 7 (GIRL'S)" , "CLASS 8 (BOY'S)" , "CLASS 8 (GIRL'S)" , "CLASS 9 (BOY'S)" , "CLASS 9 (GIRL'S)" , "CLASS 10 (BOY'S)" ,  "CLASS 10 (GIRL'S)" , "CLASS 11 (BOY'S)" , "CLASS 11 (GIRL'S)" , "CLASS 12 (BOY'S)" , "CLASS 12 (GIRL'S)"]

  mount_uploader :passportsizephoto, ImageUploader

  mount_uploader :previousgrademarksheet , AttachmentUploader

  after_create :send_email

 def send_email
   UserMailer.new_registration(self.user).deliver
 end

end
