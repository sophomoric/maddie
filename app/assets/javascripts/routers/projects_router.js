Maddie.Routers.ProjectsRouter = Backbone.Router.extend({
	initialize: function(options) {
		this.$rootEl = options.$rootEL;
		// Backbone.history.navigate("/projects", {trigger: true})
	},

	routes: {
		'': 'index',
		'Home': 'home',
		'About': 'home',
		'Inspiration': 'home',
		'Bros': 'home',
		'Work': 'index',
		'projects': 'index',
		'projects/:id': 'show'
	},
	
	home: function(){
		var viewName = Backbone.history.fragment;
		function capitaliseFirstLetter(string)
		{
		    return string.charAt(0).toUpperCase() + string.slice(1);
		}
		var homeView = new Maddie.Views[capitaliseFirstLetter(viewName)]({
			
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
