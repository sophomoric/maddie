window.Maddie = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		
		new Maddie.Routers.ProjectsRouter({
			$rootEL: $('#content')
		});
		Backbone.history.start();
  }
};
