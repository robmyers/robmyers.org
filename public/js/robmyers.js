// License: CC0

var lightbox = function () {
  var imgs = $('ul>li>img');
  imgs.each(function (index) {
    var img = $(this);
    // Repeatedly sets the value, this is better than tagging each li
    img.parent().addClass('lightbox-li');
    var url = img.attr('src');
    var newurl = url.replace(/\.(?=[^.]+)/, '__thumb.');
    img.replaceWith('<a class="lightbox-image-link" href="' + url +
                    '" data-lightbox="lightbox-' + (index + 1) + '">' +
                    '<img class="lightbox-image" src="' +
                    newurl + '" alt="' + '' + '"></a>');
  });
};

var sidebar_nav_active = function () {
  var location = document.location.pathname;
  var items = $('.sidebar-nav-item');
  items.each(function () {
    var item = $(this);
    if (item.attr("href") == location) {
      item.addClass('active');
    }});
};

$(document).ready(function () {
  lightbox();
  sidebar_nav_active();
});
