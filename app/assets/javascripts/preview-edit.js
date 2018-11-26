$(function(){

// モーダルウィンドウが開くときの処理
$(".modalOpen1").click(function(){

    var navClass = $(this).attr("class"),
        href = $(this).attr("href");
        $("#canvas").attr("src", $("#img1").attr('src'));
        $("#canvas").attr("title", $("#img1").attr('title'));
console.log("test2");
        $(href).fadeIn();
    $(this).addClass("open");

    return false;
});

// モーダルウィンドウが閉じるときの処理
$(".modalClose").click(function(){
    $(this).parents(".preview-modal").fadeOut();
    $(".modalOpen").removeClass("open");
    return false;
});

});


