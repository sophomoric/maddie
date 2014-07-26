Maddie.Views.About = Backbone.View.extend({
	
	initialize: function(options){
		this.templateName = options.templateName;
	},
	
	template: function(){
		return JST[this.templateName];
	},

	render: function() {
		
		var renderedContent = this.template({});
		
		this.$el.html(renderedContent);
		return this;
		
		
	}

});
