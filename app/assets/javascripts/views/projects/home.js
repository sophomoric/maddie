Maddie.Views.Home = Backbone.View.extend({
	
	template: function(){
		return JST["about"];
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
