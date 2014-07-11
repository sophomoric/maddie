Maddie.Views.Home = Backbone.View.extend({
	
	initialize: function(options){
		this.template = JST[options.templateName]
	},
	
	events: {
	},
	
	render: function() {
		var renderedContent = this.template({
			
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
