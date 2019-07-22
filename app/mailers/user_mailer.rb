class UserMailer < ApplicationMailer
    def digest_email_update(user)
        binding.pry
        @bug = Bug.all
        @user = user
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
