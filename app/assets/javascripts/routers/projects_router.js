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
		'media': 'media',
		'media/:id': 'mediaShow',
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
		var model = Maddie.Collections.projects.getOrFetch(id);
    var showView = new Maddie.Views.ProjectShow({
      model: model
    });

    this._swapView(showView);
  },
	
  index: function () {
		Maddie.Collections.projects.fetch();
    var indexView = new Maddie.Views.ProjectsIndex({
			collection: Maddie.Collections.projects
    });
    this._swapView(indexView);
		
		//fix with composite view tutorial
		var newProjectView = new Maddie.Views.NewProject({
			model: new Maddie.Models.Project()
		})
		this.$rootEl.append(newProjectView.render().$el)
		
  },
	
	media: function(){
		Maddie.Collections.media.fetch(); //must create that collection first...
		var mediaIndexView = new Maddie.Views.MediaIndex({
			collection: Maddie.Collections.media
		})
		
		this._swapView(mediaIndexView);
		
		//fix with composite view tutorial
		var newMediaView = new Maddie.Views.MediaNew({
			model: new Maddie.Models.Medium()
		})
		this.$rootEl.append(newMediaView.render().$el)
		
	},
	
	mediaShow: function(id){
		//GET OR FETCH FOR MEDIA HERE to pass in model below
		var model = Maddie.Collections.media.getOrFetch(id);
		var mediaShowView = new Maddie.Views.MediaShow({
			model: model
		});
		this._swapView(mediaShowView)
	},
	
  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
	
	
});
