Maddie.Views.MediaIndex = Backbone.View.extend({
	
	initialize: function(){
		this.listenTo(this.collection, "sync", this.render)
	},

  template: JST['media/index'],
	
	render: function() {
		
		var renderedContent = this.template({
			collection: this.collection
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
