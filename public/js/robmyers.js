// License: CC0
$(document).ready(function () {
  var location = document.location.pathname;
  var items = $('.sidebar-nav-item');
  items.each(function () {
    var item = $(this);
    if (item.attr("href") == location) {
      item.addClass('active');
    }});
});