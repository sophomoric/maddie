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
	},
	
	events: {
		"click #delete-medium": "deleteMedium"
	},
	
	deleteMedium: function() {
		this.model.destroy({
			success: function(){
				Maddie.appRouter.navigate("#/media", { trigger: true })
			}
		})
		
	}

});