$(document).ready(function(){
	// disable auto discover
	Dropzone.autoDiscover = false;

	// grap our upload form by its id
	$('*[id^="edit_profile"]').dropzone({
		// restrict image size to a maximum 1MB
		maxFilesize: 1,
		// changed the passed param to one accepted by
		// our rails app
		paramName: "profile[avatar]",
		// show remove links on each image upload
		addRemoveLinks: true
	});
});