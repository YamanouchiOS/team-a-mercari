$(function(){
  $('#upload-image').change(function(e){
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
        $("#js-preview").attr("src", e.target.result);
        $("#js-preview").attr("title", file.name);
        $(".visible-pc-1").empty();
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $('#upload-image2').change(function(e){
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
        $("#js-preview-1").attr("src", e.target.result);
        $("#js-preview-1").attr("title", file.name);
        $(".visible-pc-2").empty();
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $('#upload-image3').change(function(e){
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
        $("#js-preview-2").attr("src", e.target.result);
        $("#js-preview-2").attr("title", file.name);
        $(".visible-pc-3").empty();
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $('#upload-image4').change(function(e){
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
        $("#js-preview-3").attr("src", e.target.result);
        $("#js-preview-3").attr("title", file.name);
        $(".visible-pc-4").empty();
      };
    })(file);
    reader.readAsDataURL(file);
  });

});

