class @AppListView extends Backbone.Marionette.CollectionView

  el: '#app-list'

  childView: AppView

#   initialize: function(){
#     console.log('New App List View Created');
#     this.listenTo(this.collection, 'reset', function(){
#       this.emptyEl();
#       this.renderAll();
#     });
#     this.renderAll();
#   },
#
#   renderAll: function(){
#     this.collection.forEach(function(appModel) {
#       this.renderOne(appModel);
#     }.bind(this));
#   },
#
#   renderOne: function(appModel) {
#     var appView = new AppView({ model: appModel });
#     this.$el.append(appView.render().el);
#   }
#
# });
