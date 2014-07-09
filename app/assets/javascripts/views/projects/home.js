Maddie.Views.Home = Backbone.View.extend({
	
	initialize: function(options){
	},

  template: JST['projects/home'],
	
	events: {
		"click .back": "back",
		"click button": "work"
	},
	
	work: function(event){
		var urlEnd = event.target.textContent
		if (urlEnd === "back"){
			return ;
		} else if (urlEnd === "Work"){
			Backbone.history.navigate("/Work", {trigger: true})
			return ;
		}
		
		var swapTemp = JST[urlEnd]({});
		this.$el.html(swapTemp);
	},
	
	back: function(){
		this.render()
		
	},
	
	render: function() {
		var renderedContent = this.template({
			
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
