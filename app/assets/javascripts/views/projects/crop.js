Maddie.Views.CropView = Backbone.View.extend({
	initialize: function(options){
		this.project = options.project;
		this.listenTo(this.project, "sync", this.render);
	},

	template: JST['projects/crop'],

	events: {
	},

	render: function() {
		var renderedContent = this.template({
			project: this.project
		})
		this.$el.html(renderedContent);
		return this;
	}
})