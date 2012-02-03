jQuery(document).ready(function($) {
  
  repositionContentContainer();

  $('input[placeholder], textarea[placeholder]').placeholder();

  $('a.fb.inline').fancybox({
    'hideOnContentClick': true,
    beforeShow: function() {
      $('#invite textarea').val('');
    }
  });

  $('#invite a').click(function(ev) {
    ev.preventDefault();
    var $this = $(this);

    $this.text('Please wait...').addClass('inactive');
    console.log('click');

    var emails = findEmailAddresses($('#invite textarea').val());

    if (emails !== '') {
      $.ajax({
        url: $(this).attr('href'),
        data: {
          emails: emails
        },
        dataType: 'json',
        type: 'POST',
        success: function() {
          $('#invite .thanks').show().delay(3000).fadeOut();
          $('#invite textarea').val('');
          $this.text('Submit More').removeClass('inactive');
        }
      })
    } else {
      $this.text('Submit').removeClass('inactive');
    }
  })

});

function repositionContentContainer() {
  // this routine is a complete hack to work around the flash "Allow" button bug
  if ( $("#container").length > 0 ) {
    //Adjust the #content left-margin, since by default it likely isn't an int
    setLeftMargin();
    //If the User resizes the window, adjust the #content left-margin
    $(window).bind("resize", function() { setLeftMargin(); });
  }
}

function setLeftMargin() {
  var newWindowWidth = $(window).width();
  var mainWellWidth = $("#container").width();
  // create an integer based left_offset number
  var left_offset = parseInt((newWindowWidth - mainWellWidth)/2.0);
  if (left_offset < 0) { left_offset = 0; }
  $("#container").css("margin-left", left_offset);
}

function findEmailAddresses(StrObj) {
  var separateEmailsBy = ", ";
  var email = ""; // if no match, use this
  var emailsArray = StrObj.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);
  if (emailsArray) {
    email = "";
    for (var i = 0; i < emailsArray.length; i++) {
      if (i != 0) email += separateEmailsBy;
      email += emailsArray[i];
    }
  }
  return email;
}