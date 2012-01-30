$(function() {
	$('#part1').find('.next a').click(function() {
		$('#part1').fadeOut(function() {
			$('#part2').fadeIn();
		})
	})
});