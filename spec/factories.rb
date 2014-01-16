FactoryGirl.define do 
	factory :user do
		name "Scott Combes"
		email "scott.combes@gmail.com"
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end

		factory :micropost do
			name "Test"
			address "1234 Test"
			city "Testville"
			state "TX"
			postal "75028"
			phone "9725551234"
			category "Asian"
			user
		end
	end
end