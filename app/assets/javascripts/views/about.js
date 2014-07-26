Maddie.Views.About = Backbone.View.extend({
	
	initialize: function(options){
		this.templateName = options.templateName;
		console.log("initialize: templateName: ", this.templateName);
	},
	
	template: function(){
		return JST[this.templateName];
	},

	render: function() {
		console.log("render: templateName: ", this.templateName);
		var renderedContent = this.template({});
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
