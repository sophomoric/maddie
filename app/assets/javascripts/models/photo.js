Maddie.Models.Photo = Backbone.Model.extend({
	url: function(){
		return this.project.url() + "/photos"
	}

});
