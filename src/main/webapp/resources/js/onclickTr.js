$(document).ready(function() {
	$("tbody > tr").on("click", function() {
		var orgBColor = '#ffffff';
		var orgTColor = '#000000';
		var backColor = '#E0E8FF';
		var textColor = '#34495E';
		var tbody = this.parentNode;
		var trs = tbody.getElementsByTagName('tr');
		for (var i = 0; i < trs.length; i++) {
			if (trs[i] != this) {
				trs[i].style.backgroundColor = orgBColor;
				trs[i].style.color = orgTColor;
			} else {
				trs[i].style.backgroundColor = backColor;
				trs[i].style.color = textColor;
			}
		}
	});
});