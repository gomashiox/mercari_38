$(function(){

  var fileName;

  // 画像ファイル選択後のプレビュー処理
  $('form').on('change', 'input[type="file"]', function(event) {
    var file = event.target.files[0];
    fileName = file.name;
    var reader = new FileReader();
    var $crop_area_box = $('#crop_area_box');
    var $canvas = $('#canvas');

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf('image') < 0){
      return false;
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(event) {
        //既存のプレビューを削除
        $canvas.empty();
        $crop_area_box.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $crop_area_box.append($('<img>').attr({
          src: event.target.result,
          id: "crop_image",
          title: file.name
        }));
        // プレビュー処理に対して、クロップ出来る処理を初期化設定
        initCrop();
      };
    })(file);
    reader.readAsDataURL(file);
  });

  var cropper;
  $('.cropper-container').css('height','380px');
  function initCrop() {
    cropper = new Cropper(crop_image, {
      dragMode: 'move', // 画像を動かす設定
      aspectRatio: 1 / 1, // 正方形やで！
      restore: false,
      guides: false,
      center: false,
      highlight: false,
      cropBoxMovable: false,
      cropBoxResizable: false,
      toggleDragModeOnDblclick: false,
      minCropBoxWidth: 380,
      minCropBoxHeight: 380,
      ready: function () {
        croppable = true;
      }
    });
    // 初回表示時
    crop_image.addEventListener('ready', function(e){
      cropping(e);
    });
    // 画像をドラッグした際の処理
    crop_image.addEventListener('cropend', function(e){
      cropping(e);
    });
    // 画像を拡大・縮小した際の処理
    crop_image.addEventListener('zoom', function(e){
      cropping(e);
    });
  }

  // クロップ処理した画像をプレビュー領域に表示
  var croppedCanvas;
  function cropping(e) {
    croppedCanvas = cropper.getCroppedCanvas({
      width: 380,
      height: 380,

    });
    // `$('<img>'{src: croppedCanvas.toDataURL()});` 的に書きたかったけど、jQuery力が足りず・・・
    var croppedImage = document.createElement('img');
    croppedImage.src = croppedCanvas.toDataURL();
    crop_preview.innerHTML = '';
    crop_preview.appendChild(croppedImage)
    console.log(croppedImage)
    $("#canvas").attr("src", croppedImage.src);

  }

  // Submit時に実行するPOST処理
  $('#submitBtn').on('click', function(event){

    $(this).parents(".preview-modal").fadeOut();
            console.log("test3")
    $(".modalOpen").removeClass("open");
            console.log("test4")
    // var src = $("#canvas").attr('src');
    $("#img1").attr("src", $("#canvas").attr('src'));
            console.log("test5")


  });

});




