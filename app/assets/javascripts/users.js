$(function() {

	$('#new_user .submit input').click(function(ev) {
		$(this).val('Please Wait...').addClass('inactive'); 
	})

	$('#part1').find('.next a').click(function() {
		$('#part1').fadeOut(function() {
			$('#part2').fadeIn();
		})
	})

	if (!swfobject.hasFlashPlayerVersion("10.2")) {
    $('.not_supported').show();
    $('.supported').hide();
  }


});