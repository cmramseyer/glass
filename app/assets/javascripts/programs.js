function init_textarea_new_program(){
  $('textarea#program_new_program').val('PROGRAM=\nPRODUCT_CODE=\nNEW_CUT\nORDER=\nQTY=\nX=\nY=');
}

function init_textarea_sample_program(){
  $('textarea#sample_textarea').val('PROGRAM=0023\nPRODUCT_CODE=FL4CLE\nNEW_CUT\nORDER=89\nQTY=1\nX=1234\nY=567\nNEW_CUT\nORDER=122\nQTY=3\nX=888\nY=999');
}


$( document ).on('turbolinks:load', function() {
  init_textarea_new_program();
  init_textarea_sample_program();

  $('.btn-view-program-details').click(function() {
    const program_id = $(this).data("program-id");
    $.ajax({
      type: 'GET',
      dataType: 'js ',
      url: '/programs/'+ program_id,
      data: {},
      cache: false,
      success: function(data, textStatus, res) {
        console.log(res)
      },
      error: function(data, textStatus, res){
        console.log(res)
        console.log(data)
        console.log(textStatus)
      }
    });
  });
});

function update_program_detail_content(content){
  $('.modal-body').html(content);
}


