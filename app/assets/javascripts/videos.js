$(function() {
	$('#start_recording').fadeIn();

	Framey.observe('recordClicked',function() {
		$('.message').hide();
		$('#red_dot').fadeIn('fast');
	});

	Framey.observe('stopClicked',function() {
		$('.message').hide();
		$('#finish').fadeIn('fast');
	})

	Framey.observe('stopClicked',function() {
		$('.message').hide();
		$('#finish').fadeIn('fast');
	})

	Framey.observe('publishClicked',function() {
		$('.message').hide();
		$('#publishing').fadeIn('fast');
	})

	Framey.observe('publishSucceeded',function() {
		$('.message').hide();
		location.href = '/videos';
	})

	Framey.observe('publishFailed',function() {
		$('.message').hide();
		$('#failed').fadeIn('fast');
	})


});