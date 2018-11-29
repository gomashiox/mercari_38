
  // Submit時に実行するPOST処理
  $('#new-item-registration').on('click', function(event){
    // クロップ後のファイルをblobに変換し、AjaxでForm送信
        console.log("test2")
    croppedCanvas.toBlob(function (blob) {
      const fileOfBlob = new File([blob], fileName);
      var formData = new FormData();
      // `employee[avatar]` は `employee` modelに定義した `mount_uploader :avatar, AvatarUploader` のコト
      formData.append('item[image_url]', fileOfBlob);
      // EmployeeのID取得
      const item_id = $('#item_id').val();
      $.ajax('/image_url/' + item_id + '/update', {
        method: "POST", // POSTの方が良いのかな？
        data: formData,
        processData: false, // 余計な事はせず、そのままSUBMITする設定？
        contentType: false,
        success: function (res) {
          // DOM操作にしたほうがいいのかな？その場合、アップロード後に実行するなどのポーリング処理的なサムシングが必要になりそう・・・
          // なので、とりあえず簡単に`location.reload`しちゃう
          location.reload();
        },
        error: function (res) {
          console.error('Upload error');
        }
      });
    // S3にアップロードするため画質を50%落とす
    }, 'image/jpeg', 0.5);

  });

