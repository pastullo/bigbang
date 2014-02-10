class TransactionMailer < ActionMailer::Base
  default from: 'bang-them-all@aiaccelerator.com'
 
  def welcome(user, password)
    @password = password
    @user = user
    @url  = 'http://example.com/login'
    mail(to: 'flacchio@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
