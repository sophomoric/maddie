Maddie.Routers.ProjectsRouter = Backbone.Router.extend({
	initialize: function(options) {
		this.$rootEl = options.$rootEL;
		Backbone.history.navigate("/projects", {trigger: true})
		
		
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
		console.log(viewName)
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
		var that = this;
		var projects = Maddie.Collections.projects;
		projects.fetch({success: function(){
			
	    var indexView = new Maddie.Views.ProjectsIndex({
				$rootEl: this.$rootEl, //not necessary
				projects: projects
	    });
		
	    that._swapView(indexView);
			}
	
		});
  },
	
  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
	
	
});
