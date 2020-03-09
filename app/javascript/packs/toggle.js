const toggle = () => {

$(document).ready(function(){

  $('.tabs-menu a').click(function(event) {
    event.preventDefault();

    // Toggle active class on tab buttons
    $(this).parent().addClass("current");
    $(this).parent().siblings().removeClass("current");

    // display only active tab content
    var activeTab = $(this).attr("href");
    $('.tab-content').not(activeTab).css("display","none");
    $(activeTab).fadeIn();

  });

});

};

export {toggle}
