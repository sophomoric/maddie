Maddie.Views.ProjectsIndex = Backbone.View.extend({
	
	initialize: function(options){
		this.$el = options.$rootEl
	},

  template: JST['projects/index'],
	
	render: function() {
		var renderedContent = this.template({
			
		})
		
		this.$el.html(renderedContent);
		
		
	}

});
