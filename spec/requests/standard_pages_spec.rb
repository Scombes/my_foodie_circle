require 'spec_helper'

	describe "StandardPages" do

		let(:base_title) {"My Foodie Circle"}

		describe "Home page" do

			it "should have the title 'Home' " do
				visit '/standard_pages/home'
				expect(page).to_not have_title("#{base_title}| Home")
			end
  		end

  		describe "Contact page" do

			it "should have the title 'Contact' " do
				visit '/standard_pages/contact'
				expect(page).to have_title("#{base_title} | Contact")
			end
  		end

  		describe "Help Page" do

			it "should have the title 'Help' " do
				visit '/standard_pages/help'
				expect(page).to have_title("#{base_title} | Help")
			end
  		end

	end
