class UserMailer < ActionMailer::Base
  default from: "josh@birthdaywishesforlisa.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    mail to: user.email, subject: "Shhhh.  Don't tell Lisa but tell others..."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.video_posted.subject
  #
  def video_posted(video)
    @user = video.user
    @video = video
    mail to: @user.email, subject: "Your bday wish to Lisa is ready."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.late_video.subject
  #
  def late_video(user)
    @user = user
    mail to: user.email, subject: "What?  You no love Lisa?"
  end

  def invite(user, email)
    @user = user
    @email
    mail to: email, subject: "Can you record a surprise bday wish for Lisa?"
  end
end
