Maddie.Views.ProjectsIndex = Backbone.View.extend({
	
	initialize: function(){
		this.collection = Maddie.Collections.projects;
		this.listenTo(this.collection, "sync add", this.render)
	},

  template: JST['projects/index'],
	
	events: {
		"click .yearSort": "yearSort"
	},
	
	yearSort: function(){
		
	},
	
	render: function() {
		
		var renderedContent = this.template({
			collection: this.collection
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
