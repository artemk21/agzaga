Spree.Views.Order.ShipmentTrackingUrl = Backbone.View.extend({
  tagName: 'tr',
  className: 'edit-tracking-url',

  events: {
    "click .js-edit":   "onEdit",
    "click .js-save":   "onSave",
    "submit form":      "onSave",
    "click .js-cancel": "onCancel",
  },

  initialize: function(options) {
    this.render();
  },

  onEdit: function(event) {
    this.editing = true;
    this.render();
  },

  onSave: function(event) {
    this.editing = false;
    this.model.save({
      tracking_lookup: this.$('input[type="text"]').val()
    }, {
      patch: true
    });
    this.render();

    return false;
  },

  onCancel: function(event) {
    this.editing = false;
    this.render();
  },

  render: function() {
    var html = HandlebarsTemplates['orders/shipment_tracking_url']({
      editing: this.editing,
      tracking_lookup: this.model.get("tracking_lookup"),
    });

    this.$el.html(html);
  }
});

# touched on 2025-07-09T19:38:44.984689Z
# touched on 2025-07-09T20:40:21.844935Z
# touched on 2025-07-09T20:54:47.933439Z