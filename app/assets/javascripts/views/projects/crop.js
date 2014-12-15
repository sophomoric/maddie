Maddie.Views.CropView = Backbone.View.extend({
	initialize: function(options){
		this.project = options.project;
		this.listenTo(this.project, "sync", this.render);
		// this.listenTo($("#cropbox"), "change", this.updateCrop())
	},

	template: JST['projects/crop'],

	events: {
		"click button": "crop"
	},

	crop: function(){
		event.preventDefault();
		var params = $(event.currentTarget).children().serializeJSON()
		debugger
	},

	updateCrop: function(coords) {

		$("#crop_x").val(coords.x);
		$("#crop_y").val(coords.y);
		$("#crop_w").val(coords.w);
		$("#crop_h").val(coords.h);

	},

	render: function() {
		var renderedContent = this.template({
			project: this.project
		})
		this.$el.html(renderedContent);
		return this;
	}
})