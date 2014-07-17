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
	},
	
	comparator: function(project1, project2) {
		var area1 = project1.get("height") * project1.get("width");
		var area2 = project2.get("height") * project2.get("width");
		if (area1 > area2) {
			return 1;
		} else {
			return -1;
		}
	}

});

Maddie.Collections.projects = new Maddie.Collections.Projects();