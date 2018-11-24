$(function() {
    $('.hidden1').css("display", "none");
    $('.hidden2').css("display", "none");
    $('.hidden3').css("display", "none");
    $('.hidden4').css("display", "none");
    $('.hidden5').css("display", "none");
  });
   // $("#category1").change(function(){

   //  }

  //  $("#category2").change(function(){

  // });
$(document).on('change', '#category3', function() {
    if ($('#category3').val() == "----" ){
       $('.hidden3').hide();
       $('.hidden4').hide();
    } else{
      $('.hidden3').show();
      $('.hidden4').show();
    }
  });

  //  $("#cost").change(function(){
  //   if ($('#cost').val() == "----" ){
  //      $('.hidden5').hide();
  //   } else{
  //     $('.hidden5').show();
  //   }
  // });


$(document).on('change', '#category1', function() {
  console.log("test");
  return $.ajax({
    type: 'GET',
    url: '/items/get_category_ms' ,
    data: {
      category_l_id: $(this).val()
    }
  }).done(function(data) {
    if ($('#category1').val() != "----" ){
        console.log("test3");
      $('.hidden1').show();
    return $('.select-wrap1').html(data);
    }
  });
});


$(document).on('change', '#category2', function() {
  console.log("test2");
  return $.ajax({
    type: 'GET',
    url: '/items/get_category_ss',
    data: {
      category_m_id: $(this).val()
    }
  }).done(function(data) {
            console.log("test4");
    if ($('#category2').val() != "----" )
      $('.hidden2').show();
    return $('.select-wrap2').html(data);
  });
});
