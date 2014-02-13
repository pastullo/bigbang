class TransactionMailer < ActionMailer::Base
  default from: 'bigbang@aiaccelerator.com'
 
  def welcome(user, password)
    @password = password
    @user = user
    @url  = 'http://bigbang.aiaccelerator.com'
    mail(to: user.email, subject: 'Welcome to the BigBang app')
  end
end
