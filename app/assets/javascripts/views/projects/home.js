Maddie.Views.Home = Backbone.View.extend({
	
	initialize: function(options){
	},

  template: JST['projects/home'],
	
	events: {
		"click button": "work"
	},
	
	work: function(event){
		var urlEnd = event.target.textContent
		Backbone.history.navigate("/" + urlEnd, {trigger: true})
	},
	
	render: function() {
		var renderedContent = this.template({
			
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
