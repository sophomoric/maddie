Maddie.Views.NewProject = Backbone.View.extend({
	
	initialize: function(options){
		this.model = options.model;
	},
	
	template: JST["projects/new"],
	
	events: {
		"click button": "submit"
	},
	
	render: function(){
		var content = this.template({
			project: this.model
		});
		this.$el.html(content);
		return this;
	},
	
	submit: function(){
		event.preventDefault();
		
		var newProject = new Maddie.Models.Project();
		newProject.set("title", $("#title").val());
		newProject.set("description", $("#description").val());
		newProject.save({}, {
			success: function() {
				Maddie.Collections.projects.add(newProject)
			}
		})
	}
	
})