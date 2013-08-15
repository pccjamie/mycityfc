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
 // if(window.location.href.indexOf("home") > -1) {
 //         $('body').addClass('bg-default');
 //    }
	return;
}
$(function() {
	swap_bg();
});