Maddie.Models.Project = Backbone.Model.extend({
	urlRoot: "/api/projects",
	urlA: function(){
		return this.urlRoot + "/" + this.id
	},

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
	},

	uploadPhoto: function($file){
		var project = this;
		var formData = new FormData();
		formData.append("avatar", $("input:file")[0].files.item(0))

		var xhr = new XMLHttpRequest();
		xhr.open('PUT', this.urlA(), true);
		xhr.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
		xhr.onload = function(response){
			project.fetch({})
		}
		xhr.send(formData);
	}
});
