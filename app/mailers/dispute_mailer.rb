class DisputeMailer < ApplicationMailer
  def fish_disputed(user, disputer, fish, comment)
    @user = user
    @disputer = disputer
    @fish = fish
    @comment = comment
    @url = "http://gotkayak.com/competition/#{Date.today.year}/disputes"
    mail(to: @user.email, subject: 'Your fish has been disputed')
  end
end
