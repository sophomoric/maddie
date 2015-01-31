Maddie.Views.PageView = Backbone.View.extend({
  initialize: function(options) {
    this.collection = options.collection;
  },
  template: JST['static/page'],
  render: function(){
    var content = this.template({
      pages: this.collection
    });
    this.$el.html(content);
    return this;


  }
});
