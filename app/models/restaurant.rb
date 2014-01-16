class Restaurant < ActiveRecord::Base
	belongs_to :user 
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :name, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :postal, presence: true

end
