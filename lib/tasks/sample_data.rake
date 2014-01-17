namespace :db do 
	desc "Sample data for databasse"
	task populate: :environment do
		make_users
    	make_restaurants
    	make_relationships
    end
end

def make_users
		admin = User.create!(name: "Scott Combes",
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

def make_restaurants
		users = User.all(limit: 5 )
		50.times do
			name = "Test Restaurant"
			address = "1234 Test"
			city= "Testville"
			state= "TX"
			postal="75006"
			phone= "9725551234"
			category= "American"
			note= Faker::Lorem.sentence(2)
			users.each { |user| user.restaurants.create!(name: name,
														 address: address,
														 city: city,
														 state: state,
														 postal: postal,
														 phone: phone,
														 category: category,
														 note: note)}
		end
end

def make_relationships
		users = User.all
  		user  = users.first
  		followed_users = users[2..50]
  		followers      = users[3..40]
  		followed_users.each { |followed| user.follow!(followed) }
  		followers.each      { |follower| follower.follow!(user) }
end