function turn_on_checkbox_style(){
  if ($("input.flat")[0]) {
      
    $('input.flat').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
    });
  }
}

function turn_on_sidebar_menu(){
  var CURRENT_URL = window.location.href.split('#')[0].split('?')[0],
    $BODY = $('body'),
    $MENU_TOGGLE = $('#menu_toggle'),
    $SIDEBAR_MENU = $('#sidebar-menu'),
    $SIDEBAR_FOOTER = $('.sidebar-footer'),
    $LEFT_COL = $('.left_col'),
    $RIGHT_COL = $('.right_col'),
    $NAV_MENU = $('.nav_menu'),
    $FOOTER = $('footer');


  // toggle small or large menu
  $MENU_TOGGLE.on('click', function() {
    if ($BODY.hasClass('nav-md')) {
        $SIDEBAR_MENU.find('li.active ul').hide();
        $SIDEBAR_MENU.find('li.active').addClass('active-sm').removeClass('active');
    } else {
        $SIDEBAR_MENU.find('li.active-sm ul').show();
        $SIDEBAR_MENU.find('li.active-sm').addClass('active').removeClass('active-sm');
    }

    $BODY.toggleClass('nav-md nav-sm');

    setContentHeight();

    $('.dataTable').each ( function () { $(this).dataTable().fnDraw(); });
  });
}



$( document ).on('turbolinks:load', function() {
  $('[data-toggle="tooltip"]').tooltip(); 

  turn_on_sidebar_menu();
  turn_on_checkbox_style();
  
});
