$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".mark-as-unread", markAsUnread)
})

function markAsUnread(e){
  e.preventDefault();
  
  var $link = $(this).parents('.link');
  var linkId = $link.data('id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: {link: { read: false } },
  }).then((link) => updateLinkStatus(link, false))
    .fail(displayFailure);
}

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.data('id');
  var linkUrl = $link.find('.url a').text();

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: {link: { read: true, url: linkUrl } },
  }).then((link) => updateLinkStatus(link, true))
    .fail(displayFailure);
}

function updateLinkStatus(link, status) {
  var $link =  $(`.link[data-id=${link.id}]`)
  $link.find(".read-status").text(`${status}`)
  $link.toggleClass('read-false').toggleClass('read-true');
  changeButton($link, status)
}

function changeButton($link, status) {
  if(status === true) {
    $link.find(".mark-as-read").text("Mark as Unread").removeClass('.mark-as-read').addClass('.mark-as-unread');  
  } else {
    debugger
    $link.find('.mark-as-unread').text("Mark as Read").removeClass('.mark-as-unread').addClass('.mark-as-read');  
  }
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
