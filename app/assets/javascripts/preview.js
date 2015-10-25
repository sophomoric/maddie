$(function(){
  var $message = $("#page_body");
  var $previewBox = $(".welcome");
  var previewPlaceholder = $previewBox.html()
  var lastResponseMarkdown = previewPlaceholder;
  var lastTextSent = $message.val();

  $message.keyup(function(){
    delay(preview, 1000);
  })

  var delay = (function(){
    var timer = 0;
    return function(callback, ms){
      clearTimeout(timer);
      timer = setTimeout(callback, ms);
    };
  })();

  var preview = function(){
    var message = $message.val();
    if (!message) {
      displayMessage(previewPlaceholder);
    } else if (message !== lastTextSent) {
      lastTextSent = message;
      $.post("/previews", { preview: message }, displayMessage);
    } else {
      displayMessage(lastResponseMarkdown);
    };
  };

  var displayMessage = function(text){
    lastResponseMarkdown = text;
    $previewBox.html(text);
  };
});
