$(function(){
  $('#img-edit').css("display", "none");
  $('#img-delite').css("display", "none");
  $('#preview1').change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    //画像でない場合は即終了
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
  $('#img2-edit').css("display", "none");
  $('#img2-delite').css("display", "none");
  $('#preview2').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
    reader.onload = (function(file){
      return function(e){
        $("#img2").attr("src", e.target.result);
        $("#img2").attr("title", file.name);
        $('#img2-edit').show();
        $('#img2-delite').show();
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
$(document).on('click','#img2-delite', function() {
        $('#img2').removeAttr('src title style');
        $('#img2').replaceWith("<img id=img2 class=img2 style=width:138px;height:138px;>"+"サンプル"+"</img>");
        $('#img2-edit').hide();
        $('#img2-delite').hide();
  });



$(function(){
  $('#img3-edit').css("display", "none");
  $('#img3-delite').css("display", "none");
  $('#preview3').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
    reader.onload = (function(file){
      return function(e){
        $("#img3").attr("src", e.target.result);
        $("#img3").attr("title", file.name);
        $('#img3-edit').show();
        $('#img3-delite').show();
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
$(document).on('click','#img3-delite', function() {
        $('#img3').removeAttr('src title style');
        $('#img3').replaceWith("<img id=img3 class=img3 style=width:138px;height:138px;>"+"サンプル"+"</img>");
        $('#img3-edit').hide();
        $('#img3-delite').hide();
  });


$(function(){
  $('#img4-edit').css("display", "none");
  $('#img4-delite').css("display", "none");
  $('#preview4').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
    reader.onload = (function(file){
      return function(e){
        $("#img4").attr("src", e.target.result);
        $("#img4").attr("title", file.name);
        $('#img4-edit').show();
        $('#img4-delite').show();
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
$(document).on('click','#img4-delite', function() {
        $('#img4').removeAttr('src title style');
        $('#img4').replaceWith("<img id=img4 class=img4 style=width:138px;height:138px;>"+"サンプル"+"</img>");
        $('#img4-edit').hide();
        $('#img4-delite').hide();
  });

