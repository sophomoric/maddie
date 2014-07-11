Maddie.Routers.ProjectsRouter = Backbone.Router.extend({
	initialize: function(options) {
		this.$rootEl = options.$rootEL;
	},

	routes: {
		'': 'index',
		'home': 'home',
		'about': 'home',
		'inspiration': 'home',
		'bros': 'home',
		'work': 'index',
		'projects': 'index',
		'projects/:id': 'show'
	},
	
	home: function(){
		var viewName = Backbone.history.fragment;
		
		var homeView = new Maddie.Views.Home({
			templateName: viewName
		});
		
		this._swapView(homeView);
		
	},
	
  show: function (id) {
		var project = Maddie.Collections.projects.get(id)
    var showView = new Maddie.Views.ProjectShow({
      model: project
    });

    this._swapView(showView);
  },
	
  index: function () {
		Maddie.Collections.projects.fetch();
    var indexView = new Maddie.Views.ProjectsIndex({
			collection: Maddie.Collections.projects
    });
    this._swapView(indexView);
		
		var newProjectView = new Maddie.Views.NewProject({
			model: new Maddie.Models.Project()
		})
		this.$rootEl.append(newProjectView.render().$el)
  },
	
  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
	
	
});
