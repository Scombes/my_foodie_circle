FactoryGirl.define do 
	factory :user do
		name "Scott Combes"
		email "scott.combes@gmail.com"
		password "foobar"
		password_confirmation "foobar"
	end
end