Maddie.Models.Medium = Backbone.Model.extend({
	urlRoot: "/api/media",
	
	projects: function(){
		if (!this._projects){
			this._projects = new Maddie.Collections.Projects({
				media: this.collection //not sure if correct here or in project.js
			})
		}
		
		return this._projects
	},
	
	parse: function(jsonResp){
		if (jsonResp.projects){
			this.projects().set(jsonResp.projects);
			delete jsonResp.projects
		}
		return jsonResp;
	}

});
