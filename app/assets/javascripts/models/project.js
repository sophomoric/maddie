Maddie.Models.Project = Backbone.Model.extend({
	urlRoot: "/api/projects",
	
	media: function() {
		if (!this._media){
			this._media = new Maddie.Collections.Media([], {
				projects: this.collection
			})
		}
		
		return this._media;
	},
	
	photos: function() {
		if (!this._photos){
			this._photos = new Maddie.Collections.Photos([], {
				project: this
			})
		}
		
		return this._photos
	},
	
	parse: function(jsonResp){
		if (jsonResp.media){
			this.media().set(jsonResp.media);
			delete jsonResp.media
		}
		
		if (jsonResp.photos){
			this.photos().set(jsonResp.photos);
			delete jsonResp.photos
		}
		
		return jsonResp
	}
});
