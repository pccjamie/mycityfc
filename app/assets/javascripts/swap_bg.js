function swap_bg() {

 if(window.location.href.indexOf("fan") > -1) {
        $('body').addClass('bg-fan-profiles');
    }
 if(window.location.href.indexOf("parent") > -1) {
         $('body').addClass('bg-parent-profiles');
    }
 if(window.location.href.indexOf("slides") > -1) {
         $('body').addClass('bg-slides');
    }
	return;
}
$(function() {
	swap_bg();
});