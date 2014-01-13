require 'spec_helper'

	describe "StandardPages" do

		let(:base_title) {"My Foodie Circle"}

		subject { page }

  		describe "Home page" do
    		before { visit root_path }
			it { should have_title(full_title('')) }
    		it { should_not have_title('| Home') }
  		end

  		describe "Contact page" do
    		before { visit contact_path }
			it { should have_title(full_title('Contact')) }
  		end

  		describe "Help page" do
    		before { visit help_path }
			it { should have_title(full_title('Help')) }
  		end

	end
