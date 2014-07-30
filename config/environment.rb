# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Bigbang::Application.initialize!

ActionMailer::Base.smtp_settings = {
	:address   => "smtp.mandrillapp.com",
    :port      => 25, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => "tony@5rooms.com",
    :password  => "iCiaBpvqZJh64FGW24hOhw", # SMTP password is any valid API key
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
    :domain => 'nadia.africainternetventures.com', # your domain to identify your server when connecting
}


#  config.action_mailer.smtp_settings = {
#     :address   => "smtp.mandrillapp.com",
#     :port      => 25, # ports 587 and 2525 are also supported with STARTTLS
#     :enable_starttls_auto => true, # detects and uses STARTTLS
#     :user_name => "tony@5rooms.com",
#     :password  => "XXXX", # SMTP password is any valid API key
#     :authentication => 'login', # Mandrill supports 'plain' or 'login'
#     :domain => 'nadia.africainternetventures.com', # your domain to identify your server when connecting
#   }
