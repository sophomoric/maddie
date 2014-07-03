Maddie.Views.ProjectsIndex = Backbone.View.extend({
	
	initialize: function(options){
	},

  template: JST['projects/index'],
	
	events: {
		"click .back": "back"
	},
	
	render: function() {
		var renderedContent = this.template({
			
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}, 
	
	back: function(){
		
		window.Maddie.appRouter.navigate("/home", {trigger: true})
		// console.log("here")
		
	}

});
