Maddie.Views.HomeScreenView = Backbone.View.extend({
	
	template: JST["static/home"],

	render: function() {
		var renderedContent = this.template({});
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
