module ApplicationHelper

	#Full title helper
	def full_title(page_title)
		base_title= "My Foodie Circle"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
