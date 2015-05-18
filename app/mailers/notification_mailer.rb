class NotificationMailer < ActionMailer::Base
  default from: "no-reply@teasterapp.com"

  def comment_added
  	mail(to: "sunwong11@gmail.com", 
  		subject: "A comment has been added to your place")
  end
end
