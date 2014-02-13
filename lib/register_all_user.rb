puts "ciao"

users = [
	{ :name => 'Flavio Bezzeccheri', :email => "flacchio@gmail.com" },
	{ :name => 'Tim', :email => "tim.lycett@aiaccelerator.com" },
	{ :name => 'stephen', :email => "stephen.richards@5rooms.com" }
]

# range for random password
range = [*'0'..'9', *'a'..'z', *'A'..'Z']

users.each do |u|
	# puts "#{u.inspect}"

	password = Array.new(8){range.sample}.join
	puts "#{u[:name]} - #{u[:email]} - #{password}"
	user = User.new(:name => u[:name], :email => u[:email], :password => password, :password_confirmation => password)
	if user.save
		puts "User #{user.id} created!"
	else 
		puts "Error #{user.errors.full_messages}"
	end
	puts "Sending welcome email"
	TransactionMailer.welcome(user, password).deliver
	puts "Email sent"
end