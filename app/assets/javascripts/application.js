// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
  // the compiled file.
  //
  // WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
  // GO AFTER THE REQUIRES BELOW.
  //
  //= require jquery_ujs
  //= require framey
  //= require swfobject
  //= require_tree .
  //
  jQuery(document).ready(function($) {
    $(":input[placeholder]").placeholder();

    $('a.fb.inline').fancybox({
      'hideOnContentClick': true,
      beforeShow: function  () {
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
        data: {emails: emails},
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
