Maddie.Views.ProjectShow = Backbone.View.extend({
	
	initialize: function(options){
		this.model = options.model;
		this.listenTo(this.model, "sync", this.render);
		this.open = false; //editing mode
	},

  template: function() {
  	if (this.open){
  		return JST['projects/edit'];
  	} else {
  		return JST['projects/show'];
  	}
  },
	
	events: {
		"click .back": "back",
		"click .edit-mode": "beginEditing",
		"click .cancel": "cancelEdit"
	},
	
	render: function() {
		var renderedContent = this.template()({
			model: this.model
		})
		
		this.$el.html(renderedContent);
		return this;
		
		
	}, 
	
	back: function(){
		
		window.Maddie.appRouter.navigate("", {trigger: true})
		// console.log("here")
		
	},
	
	beginEditing: function(){
		this.open = true;
		this.render();
	},
	
	cancelEdit: function(){
		this.open = false;
		this.render();
	}

});