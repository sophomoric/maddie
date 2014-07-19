Maddie.Views.MediaNew = Backbone.View.extend({

  template: JST['media/new'],
	
	events: {
		"submit form": "createMedium"
		
	},
	
	createMedium: function() {
		event.preventDefault();
		
		var params = $(event.currentTarget).children().serializeJSON()
		var newMedium = new Maddie.Models.Medium(params);
		
		var view = this
		
		newMedium.save({}, {
			success: function() {
				Maddie.Collections.media.add(newMedium)
				view.render(); //clears out the form... could use val...
			}
		}) // repetitive code for creating project...
	},
	
	render: function() {
		
		var renderedContent = this.template({
			model: this.model
		})
		
		this.$el.html(renderedContent);
		return this;
		
	}

});