class UserMailer < ApplicationMailer
    default from: "notifications@example.com"

    def welcome_email
        @user = params[:user]
        @url = new_user_session_url
        mail(to: @user.email, subject: "Welcome to Cat Advise")
    end
end