# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_registration
  def new_registration
    # UserMailer.with(user: User.fourth).new_registration
    UserMailer.new_registration(User.last)
  end

end
