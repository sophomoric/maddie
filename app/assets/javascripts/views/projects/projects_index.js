Maddie.Views.ProjectsIndex = Backbone.View.extend({
	
	initialize: function(options){
		// options.collection = this.collection
		this.listenTo(this.collection, "sync add", this.render)
	},

  template: JST['projects/index'],
	
	events: {
		"click .back": "back"
	},
	
	render: function() {
		
		var renderedContent = this.template({
			collection: this.collection
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}, 
	
	back: function(){
		
		window.Maddie.appRouter.navigate("Home", {trigger: true})
		// console.log("here")
		
	}

});
