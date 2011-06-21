(function($) {
  $.growl = {
    alert: function(message){
      $.gritter.add({
        title: "Ошибка",
        text: message,
        image: '/images/icons/warning-48.png'
      });
    },
    notice: function(message) {
      $.gritter.add({
        title: "Оповещение",
        text: message,
        image: '/images/icons/info-48.png'
      });
    }
  };
})(jQuery);