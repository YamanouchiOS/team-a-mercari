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






  // カテゴリーの非同期表示

  // 変数
  var select_box_middle = `<select class="select-default" id="select_middle" name="product[product_category_attributes][middle_class_id"])></select>`
  var select_box_small = `<select class="select-default" id="select_small" name="product[product_category_attributes][small_class_id"])></select>`
  var default_select = `<option value=0>---</option>`

  // 関数
  function create_option_midddle(data){
    var option = `<option value=${data.id }">
  ${data.name}</option>`
    $("#select_middle").append(option)
  };

  function create_option_small(data){
    var option = `<option value=${data.id }">
  ${data.name}</option>`
    $("#select_small").append(option)
  };

  // イベント処理
  $('#select_large').on("change", function(e) {
    var input = $("#select_large").val();
    var url = "/dynamic_select_middle";
    console.log(input);
    console.log(input + url);
    $.ajax({
      url: input + url,
      type: "GET",
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      console.log(data);
      console.log(select_box_middle)
      $("#select_large").after(select_box_middle);
      $("#select_middle").append(default_select);
      data.forEach(function(data){
        create_option_midddle(data)
      })
    })
    .fail(function(){
      alert("非同期通信に失敗しました")
    })
  })

  $(".select-wrap").on("change", "#select_middle", function(e) {
    var input = $("#select_middle").val();
    var url = "/dynamic_select_small";
    console.log(input);
    console.log(input + url);
    $.ajax({
      url: input + url,
      type: "GET",
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      console.log(data);
      console.log(select_box_small)
      $("#select_middle").after(select_box_small);
      $("#select_small").append(default_select);
      data.forEach(function(data){
        create_option_small(data)
      })
    })
    .fail(function(){
      alert("非同期通信に失敗しました")
    })
  })
});

