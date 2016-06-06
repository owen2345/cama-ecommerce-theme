//= require ./imagezoom
//= require ./jquery.flexslider
//= require_self

$(window).load(function() {
    $('.flexslider').flexslider({
        animation: "slide",
        controlNav: "thumbnails"
    });
});