Maddie.Routers.ProjectsRouter = Backbone.Router.extend({
	initialize: function(options) {
		this.$rootEl = options.$rootEL;
		Backbone.history.navigate("/projects", {trigger: true})
		
		
	},

	routes: {
		'': 'index',
		'home': 'home',
		'projects': 'index',
		'projects/:id': 'show'
	},
	
	home: function(){
		var homeView = new Maddie.Views.Home({
			
		});
		
		this._swapView(homeView);
		
	},
	
  show: function (id) {
    var showView = new Maddie.Views.ProjectShow({
      model: project
    });

    this._swapView(showView);
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
