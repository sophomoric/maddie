Maddie.Views.Home = Backbone.View.extend({
	
	initialize: function(options){
	},

  template: JST['projects/home'],
	
	events: {
		"click .work": "work"
	},
	
	work: function(){
		
		Backbone.history.navigate("/projects", {trigger: true})
	},
	
	render: function() {
		var renderedContent = this.template({
			
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
