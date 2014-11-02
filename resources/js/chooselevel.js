$(document).ready(function() {
	$(".chooselevel").click(function(event) {
		var level = $(this).html();
		window.location.href = "flashcard?level=" + level;
	});
	$(".choosetype").click(function(event) {
		var level = $("#toeiclevel").text().split(" ")[1].trim();
		if ($(this).text().trim() == "Photo") {
			window.location.href = "photo?level="+level;
		}
		if ($(this).text().trim() == "Short conversation") {
			window.location.href = "shortconversation?level="+level;
		}
	});
});