puts "ciao"

users = [
	{ :name => 'ab', :email => "email@email1.com" },
	{ :name => 'ab', :email => "email@email2.com" },
	{ :name => 'ab', :email => "email@email3.com" }
]

# range for random password
range = [*'0'..'9', *'a'..'z', *'A'..'Z']

users.each do |u|
	# puts "#{u.inspect}"

	password = Array.new(8){range.sample}.join
	puts "#{u[:name]} - #{u[:email]} - #{password}"
	user = User.new(:name => u[:name], :email => u[:email], :password => password, :password_confirmation => password)
	user.save
	puts "User #{user.id} created!"

	puts "Sending welcome email"
	TransactionMailer.welcome(user, password).deliver
	puts "Email sent"
end