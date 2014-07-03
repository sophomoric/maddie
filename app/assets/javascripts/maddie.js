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
