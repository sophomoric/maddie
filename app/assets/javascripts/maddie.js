window.Maddie = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

		window.Maddie.appRouter = new Maddie.Routers.ProjectsRouter({
			$rootEL: $('#content')
		});
		Backbone.history.start();

  }
};

Backbone.CompositeView = Backbone.View.extend({
	addSubview: function(selector, view) {
		var selectorSubviews = this.subviews()[selector] || (this.subviews()[selector] = []);
		selectorSubviews.push(view)
	},

	renderSubviews: function() {
		_(this.subviews).each(function(selectorSubviews, selector){
			_(selectorSubviews).each(function (subview) {
				subview.render();
			});
		});
	},

	subviews: function(){
		if (!this._subviews){
			this._subviews = {}
		}
		return this._subviews;
	}
})

Maddie.helpers = {
	currentUserClass: function(){
		if (globalHash["currentUser"]) {
			return "logged-in"
		} else {
			return "not-logged-in"
		}
	}
}

// Maddie.helpers["currentUserClass"]
