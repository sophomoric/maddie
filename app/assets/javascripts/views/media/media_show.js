Maddie.Views.MediaShow = Backbone.View.extend({
	
	initialize: function(){

	},

  template: JST['media/show'],
	
	render: function() {
		
		var renderedContent = this.template({
			model: this.model
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});