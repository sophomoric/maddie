Maddie.Views.Home = Backbone.View.extend({
	
	initialize: function(){
		this.templateName = "about";
	},
	
	template: function(){
		return JST[this.templateName];
	},
	
	events: {
	},
	
	render: function() {
		this.templateName = Backbone.history.fragment;
		var renderedContent = this.template()({
			
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
