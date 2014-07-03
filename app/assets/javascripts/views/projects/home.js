Maddie.Views.Home = Backbone.View.extend({
	
	initialize: function(options){
	},

  template: JST['projects/home'],
	
	events: {
		
	},
	
	render: function() {
		var renderedContent = this.template({
			
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
