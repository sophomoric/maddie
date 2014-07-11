Maddie.Collections.Media = Backbone.Collection.extend({
	url: "/api/media",
	
  model: Maddie.Models.Medium

});

Maddie.Collections.media = new Maddie.Collections.Media();