$(function(){
  var $photoList = $(".user-photos");
  var $body = $("#page_body");

  $photoList.click(function(){
    imageTag = event.target;
    if (imageTag.tagName !== "IMG") { return ; }
    currentText = $body.val();
    $body.val(currentText + imageTag.outerHTML);
    $body.keyup();
  });
});
