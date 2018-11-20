$(function(){
  $(".owl-dots li").mouseover(function(e){
    $(".owl-dot").removeClass("active");
    $(this).addClass("active");
    var index = $(this).index();
    index = index * -300 + "px"
    $(".owl-stage").animate({left: index},500);
    e.preventDefault();
  });
});

