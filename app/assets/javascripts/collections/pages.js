Maddie.Collections.Pages = Backbone.Collection.extend({
	url: "/api/pages",

  model: Maddie.Models.Page

});

Maddie.Collections.pages = new Maddie.Collections.Pages();
