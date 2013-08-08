function swap_bg() {

	if ($('body').hasClass('bg-fan-profiles'))
	{
		$(this).removeClass('bg-fan-profiles').addClass('bg-parent-profiles');
	}
	else {
		$(this).removeClass('bg-fan-parents').addClass('bg-fan-profiles');
	}
	return;
}

$(function() {
	$('#utility #lower').on('click', "#lower ul li a", swap_bg);
});