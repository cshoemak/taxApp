$(function() {
	$('.datepick').each(function() {
			$(this).attr("type", "text"); // change input type to text so chrome doesn't use its date picker.
			$(this).datepicker(); // set up datepickers
	});
});