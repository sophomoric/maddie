Maddie.Views.MediaShow = Backbone.View.extend({
	
	initialize: function(){
		this.listenTo(this.model, "sync", this.render)
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