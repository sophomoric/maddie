Maddie.Routers.ProjectsRouter = Backbone.Router.extend({
	initialize: function(options) {
		this.$rootEl = options.$rootEL;
		
		
	},

	routes: {
		'': 'index',
		'projects/:id': 'show'
	},
	
  show: function (id) {
    var showView = new Maddie.Views.ProjectShow({
      model: project
    });

    that._swapView(showView);
  },
	
  index: function () {
    var indexView = new Maddie.Views.ProjectsIndex({
			$rootEl: this.$rootEl
    });
    this._swapView(indexView);
  },
	
  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
	
	
});
