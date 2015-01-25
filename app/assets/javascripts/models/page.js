Maddie.Models.Page = Backbone.Model.extend({
	urlRoot: "/api/pages",
	url: function(){
		return this.urlRoot + "/" + this.id
	}
});
