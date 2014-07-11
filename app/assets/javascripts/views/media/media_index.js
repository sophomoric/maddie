Maddie.Views.MediaIndex = Backbone.View.extend({

  template: JST['media/index'],
	
	render: function() {
		
		var renderedContent = this.template({
			collection: this.collection
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
