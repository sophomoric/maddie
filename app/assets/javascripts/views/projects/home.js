Maddie.Views.Home = Backbone.View.extend({
	
	template: JST["about"],

	render: function() {
		var renderedContent = this.template({});
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
