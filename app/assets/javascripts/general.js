function turn_on_checkbox_style(){
  if ($("input.flat")[0]) {
      
    $('input.flat').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
    });
  }
}

$( document ).on('turbolinks:load', function() {
  $('[data-toggle="tooltip"]').tooltip(); 



  
  turn_on_checkbox_style();
  
});
