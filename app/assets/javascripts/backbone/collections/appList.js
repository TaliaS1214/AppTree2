AppCollection = Backbone.Collection.extend({
  initialize: function(){
    console.log('New App Collection Created');
  },
  model: AppModel,
  url: '/apps'
});
