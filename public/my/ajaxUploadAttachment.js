var ajaxUploadImage = function() {
	$(document).on('change', '.btn-file :file', function() {
		var input = $(this),
		    numFiles = input.get(0).files ? input.get(0).files.length : 1,
		    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		input.trigger('fileselect', [numFiles, label]);
	});
	$(document).ready(function() {
		$('.btn-file :file').on('fileselect', function(event, numFiles, label) {
			var form = new FormData();
			var attachment = $(this).closest(".attachment");
			var attachment_id = attachment.find(".attachment_id").val();
			if (attachment_id) {
				var url = "/backends/attachments/update/" + attachment_id;
				var file = this.files[0];
				form.append('file', file);
				form.append('id', attachment_id);

				var xhr = new XMLHttpRequest();
				xhr.open('post', url, true);
				xhr.onload = function() {
					response = $.parseJSON(this.response);
					attachment.find('img').attr('src', response.file.url);
					attachment.find(".attachment_id").val(response.id);
				};
				xhr.send(form);
			} else {

				var url = "/backends/attachments/create";
				var file = this.files[0];
				form.append('file', file);
				form.append('id', attachment_id);

				var xhr = new XMLHttpRequest();
				xhr.open('put', url, true);
				xhr.onload = function() {
					response = $.parseJSON(this.response);
					attachment.find('img').attr('src', response.file.url);
					attachment.find(".attachment_id").val(response.id);
				};
				xhr.send(form);
			}

		});
	});
	$(".remove_attachment").on('click',function() {
		var attachment = $(this).closest(".attachment");
		var attachment_id = attachment.find(".attachment_id").val();
		if (attachment_id) {
			$.ajax({
				method : "DELETE",
				url : "/backends/attachments/delete",
				data: {
					id: attachment_id
				},
				success : function(response) {
					attachment.find(".attachment_id").val('');
					attachment.find("img").attr('src', 'http://www.placehold.it/400x300/EFEFEF/AAAAAA&amp;text=no+image');
				}
			});

		};
	});
};
ajaxUploadImage();

$(document).ready(function() {
	$(".new_attachment").on('click',function() {
		$.get('/backends/attachments/new', function(response) {
			$(".attachments").append(response);
			ajaxUploadImage();
		});
	});
});
