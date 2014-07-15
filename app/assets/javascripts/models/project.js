Maddie.Models.Project = Backbone.Model.extend({
	urlRoot: "/api/projects"
	
	media: function() {
		if (!this._media){
			this._media = new Maddie.Collections.Media([], {
				project: this
			})
		}
		
		return this._media;
	}
});
