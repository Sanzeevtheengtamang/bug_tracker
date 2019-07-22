class UserMailer < ApplicationMailer
    def digest_email_update(user)
    
        @bugs = Bug.where("user_id = ?" ,user.id) && Bug.where( "status != ?" , "0").count
        @solved = Bug.where("user_id = ?" ,user.id) && Bug.where( "status = ?" , "0").count
        binding.pry
        @user = user
        mail(to: @user.email, subject: 'Welcome to Bug Tracker')
    end
end
