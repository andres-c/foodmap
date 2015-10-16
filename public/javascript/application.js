$(document).ready(function() {

  $(".button-collapse").sideNav();

  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal-trigger').leanModal();
 
  $('.tabs-wrapper .row').pushpin({ top: $('.tabs-wrapper').offset().top });
});

//Opens sign_up_modal
$(document).on("click", "#signup-button", function() {
  $('#sign_up_modal').openModal();
  });


