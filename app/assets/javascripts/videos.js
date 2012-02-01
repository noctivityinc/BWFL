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
		$('#record').hide();
		$('#guestbook').fadeIn();
	})

	Framey.observe('publishFailed',function() {
		$('.message').hide();
		$('#failed').fadeIn('fast');
	})

	$(".various").fancybox({
		maxWidth	: 600,
		maxHeight	: 350,
		fitToView	: true,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: true,
		openEffect	: 'none',
		closeEffect	: 'none'
	});

	$.ajaxSettings.dataType = "html";

	$("#more a")
		.live('click', function() {$(this).hide() } )
		.live('ajax:success',    function(event, data, status, xhr) { $('#catalog').append($(data)) })

});

var toggleLoading = function(what) { console.log(what); $("#loading").toggle() };
