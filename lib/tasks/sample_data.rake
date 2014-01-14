namespace :db do 
	desc "Sample data for databasse"
	task populate: :environment do

		User.create!(name: "Scott Combes",
					 email: "scott.combes@gmail.com",
					 password: "foobar",
					 password_confirmation: "foobar",
					 admin: true)

		99.times do |n|
			name  = Faker::Name.name
			email = "example-#{n+1}@example.com"
			password = "Password"
			User.create!(name: name,
						email: email,
						password: password,
						password_confirmation: password)
		end
	end
end