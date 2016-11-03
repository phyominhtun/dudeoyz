module ApplicationHelper
	def title
		base_title = "Oyz.KR - Shorten URL Service"
		if @title.nil?
			base_title
		else
			"#{@title} | #{base_title}"
		end
	end
end
