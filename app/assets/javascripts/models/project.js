Maddie.Models.Project = Backbone.Model.extend({
	urlRoot: "/api/projects",
	
	media: function() {
		if (!this._media){
			this._media = new Maddie.Collections.Media([], {
				project: this
			})
		}
		
		return this._media;
	},
	
	parse: function(jsonResp){
		if (jsonResp.media){
			this.media().set(jsonResp.media);
			delete jsonResp.media
		}
		return jsonResp
	}
});
