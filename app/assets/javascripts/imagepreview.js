$(function(){
  $('#img-edit').css("display", "none");
  $('#img-delite').css("display", "none");
  $('#preview1').change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();

    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }

    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img1").attr("src", e.target.result);
        $("#img1").attr("title", file.name);
        $('#img-edit').show();
        $('#img-delite').show();
        // var div = $('<div class="img-edit"></div>');
        // $("#img1").append(div);
        // console.log(aaaa)
      };
    })(file);
    reader.readAsDataURL(file);
  });
});


$(document).on('click','#img-delite', function() {
        $('#img1').removeAttr('src title style');
        $('#img1').replaceWith("<img id=img1 class=img1 style=width:138px;height:138px;>"+"サンプル"+"</img>");
        $('#img-edit').hide();
        $('#img-delite').hide();
  });








$(function(){
  $('#preview2').change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();

    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }

    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img2").attr("src", e.target.result);
        $("#img2").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);

  });
});


$(function(){
  $('#preview3').change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();

    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }

    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img3").attr("src", e.target.result);
        $("#img3").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);

  });
});


$(function(){
  $('#preview4').change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();

    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }

    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img4").attr("src", e.target.result);
        $("#img4").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);

  });
});
