module ApplicationHelper

	def flash_message
		if flash["notice"].present?
			tag :hr
			content_tag :p do
				flash["notice"]
			end
		elsif flash["alert"].present?
			tag :hr
			content_tag :ul do
				flash["alert"].map do |error_message|
					concat( content_tag(:li, error_message))
				end
			end
		end
	end

end
