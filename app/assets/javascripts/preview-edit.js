$(function(){

// モーダルウィンドウが開くときの処理
$(".modalOpen1").click(function(){

    var navClass = $(this).attr("class"),
        href = $(this).attr("href");
    var src = $("#img1").attr('src');
        $("#canvas").empty();
        $("#canvas").attr("src", $("#img1").attr('src'));
        $("#canvas").attr("title", $("#img1").attr('title'));
        $(href).fadeIn();
    $(this).addClass("open");
    return false;
});



// モーダルウィンドウが閉じるときの処理
$("#preview-modalClose").click(function(){
    $(this).parents(".preview-modal").fadeOut();
    $(".modalOpen").removeClass("open");
    return false;
});
$("#preview-edit-cancell").click(function(){
    $(this).parents(".preview-modal").fadeOut();
    $(".modalOpen").removeClass("open");
    return false;
});
// $("#preview-edit-finish").click(function(){
//     $(this).parents(".preview-modal").fadeOut();
//     $(".modalOpen").removeClass("open");
//     return false;
// });
});


