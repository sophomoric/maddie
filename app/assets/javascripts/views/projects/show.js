Maddie.Views.ProjectShow = Backbone.View.extend({
	
	initialize: function(options){
		// options.collection = this.collection
		this.model = options.model;
		this.listenTo(this.model, "sync", this.render);
	},

  template: JST['projects/show'],
	
	events: {
		"click .back": "back"
	},
	
	render: function() {
		var renderedContent = this.template({
			model: this.model
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}, 
	
	back: function(){
		
		window.Maddie.appRouter.navigate("", {trigger: true})
		// console.log("here")
		
	}

});