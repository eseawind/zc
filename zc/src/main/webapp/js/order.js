

var DeliveryInfo = function(base) {
  this.base = base;
  this.delivery_id = 0;
};
DeliveryInfo.prototype = {
 
  
  init: function() {
    var _this = this;
   
  
  },

  
};

var DeliveryInfoDialog = function(dom_id) {
  this.dialog_id = dom_id;
  this.delivery_info_dameon = null;

};
DeliveryInfoDialog.prototype = {
  get_dialog: function() {
    return $("#" + this.dialog_id);
  },
  content_area: function() {
    return this.get_dialog().find(".newAddress");
  },
  close_button: function() {
    return this.get_dialog().find(".close");
  },
 
  
  init: function() {
    this.delivery_info_dameon = new DeliveryInfo(this.content_area());
    this.delivery_info_dameon.init();
    this.get_dialog().dialog({
      autoOpen: false,
      modal: true,
      show: "fade",
      hide:"fade",
      dialogClass: "dialogc",
      draggable: false,
      resizable: false,
      width: 803,
      position: ["center", "middle"]
    });

    var _this = this;
    this.close_button().click(function(e) {
      e.preventDefault();
      _this.close();
    });
   
   
  },
  open: function() {
    this.get_dialog().dialog("open");
  },
  close: function() {
    this.get_dialog().dialog("close");
  },
 
  add: function(callback) {
    this.callback_after_commit = callback;
   
    this.open();
  },
  commit: function() {
    var _this = this;
    this.delivery_info_dameon.save(function(data, di) {
      _this.close();
      _this.callback_after_commit(data, di);
    });
  }
};

