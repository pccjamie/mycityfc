function swap_bg() {

	if ($('body').hasClass('bg-fan-profiles')){
		$(this).removeClass('bg-fan-profiles').addClass('bg-parent-profiles');
	}
	if ($('body').hasClass('bg-parent_profiles')) {
		$(this).removeClass('bg-fan-parents').addClass('bg-fan-profiles');
	}
	return;
}

$(function() {
	$('#utility-bar #lower').on('click', "ul li a", swap_bg);
});