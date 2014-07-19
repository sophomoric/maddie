Maddie.Views.Home = Backbone.View.extend({
	
	template: function(){
		var viewName = Backbone.history.fragment;
		console.log(viewName)
		return JST[viewName];
	},
	
	events: {
	},
	
	render: function() {
		var renderedContent = this.template()({
			
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
