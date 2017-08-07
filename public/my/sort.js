var sortItems = $(".sortable_items");

if (sortItems) {
	var url = sortItems.data('url');
	sortItems.sortable({
		stop : function(event, ui) {
			console.log('stop');
			var sort = [];
			var children = sortItems.children();
			children.each(function() {
				var item = $(this).data('item');
				sort.push(item);
			});
			$.ajax({
				url : url,
				type : 'post',
				data : {
					sort : sort,
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {

				},
				success : function(response) {
					console.log('ok');
				},
			});
		},
	});
	sortItems.disableSelection();
}
