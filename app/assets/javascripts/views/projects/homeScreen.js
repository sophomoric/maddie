Maddie.Views.HomeScreenView = Backbone.View.extend({

	initialize: function(options){
		this.collection = options.collection
    this.listenTo(this.collection, "sync add", this.render)
	},

	template: JST["static/home"],

	render: function() {
		var renderedContent = this.template({pages: this.collection});

		this.$el.html(renderedContent);
		return this;


	}

});
