Maddie.Collections.Projects = Backbone.Collection.extend({
	url: "/api/projects",
	
  model: Maddie.Models.Project,
	
	getOrFetch: function(id) {
		var model;
		if (model = this.get(id)){
			model.fetch();
			return model;
		} else {
			model = new Maddie.Models.Project({id: id})
			model.fetch({
				success: function() { Maddie.Collections.projects.add(model)}
			});
			return model;
		}
	}

});

Maddie.Collections.projects = new Maddie.Collections.Projects();