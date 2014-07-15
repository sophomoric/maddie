Maddie.Collections.Media = Backbone.Collection.extend({
	url: "/api/media",
	
  model: Maddie.Models.Medium,
	
	getOrFetch: function(id) {
		var model;
		if (model = this.get(id)){
			model.fetch();
			return model;
		} else {
			model = new Maddie.Models.Medium({id: id})
			model.fetch({
				success: function() { Maddie.Collections.media.add(model)}
			});
			return model;
		}
	}

});

Maddie.Collections.media = new Maddie.Collections.Media();