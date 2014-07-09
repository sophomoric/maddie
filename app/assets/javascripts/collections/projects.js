Maddie.Collections.Projects = Backbone.Collection.extend({
	url: "/api/projects",
	
  model: Maddie.Models.Project

});

Maddie.Collections.projects = new Maddie.Collections.Projects();