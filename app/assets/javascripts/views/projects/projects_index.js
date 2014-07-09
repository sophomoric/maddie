Maddie.Views.ProjectsIndex = Backbone.View.extend({
	
	initialize: function(options){
		this.projects = options.projects;
	},

  template: JST['projects/index'],
	
	events: {
		"click .back": "back"
	},
	
	render: function() {
		var renderedContent = this.template({
			projects: this.projects
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}, 
	
	back: function(){
		
		window.Maddie.appRouter.navigate("home", {trigger: true})
		// console.log("here")
		
	}

});
