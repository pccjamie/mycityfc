module ApplicationHelper
	def swap_bg
	if current_page?(url_for(:controller => 'fan_profiles'))
		body_push_class = 'bg-fan-profiles'
	elsif
		current_page?(url_for(:controller => 'parent_profiles'))
		body_push_class = 'bg-parent-profiles'
	else
		current_page?(url_for(:controller => 'slides'))
		body_push_class = 'bg-slides'
	end
	end

end
