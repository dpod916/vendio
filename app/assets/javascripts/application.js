// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require inspinia.js
//= require tables.js
//= require forms.js
//= require miscellaneous.js
//= require graphs.js
//= require appviews.js
//= require cocoon
//= require dropzone
//= require best_in_place
//= require jquery.tokeninput
//= require video/responsible-video.js
//= require sparkline/jquery.sparkline.min.js
//= require jquery-ui/jquery-ui-1.10.4.min.js
//= require iCheck/icheck.min.js
//= require touchpunch/jquery.ui.touch-punch.min.js
//= require best_in_place.jquery-ui
//= require arrive.js
//= require_self




// $('[data-provider="summernote"]').each(function(){
//   $(this).summernote({ });
// })


// jQuery(function() {
//   if ($('.pagination').length) {
//     $(window).scroll(function() {
//       var url;
//       url = $('.pagination .next_page').attr('href');
//       if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
//         $('.pagination').text("Fetching more Activity...");
//         return $.getScript(url);
//       }
//     });
//     return $(window).scroll();
//   }
// });

// jQuery(function() {
//   if ($('.pagination').length) {
//     $('#append_and_paginate').prepend('<a id="append_more_results" href="javascript:void(0);">Show more Activity</a>');
//     return $('#append_more_results').click(function() {
//       var url;
//       url = $('.pagination .next_page').attr('href');
//       if (url) {
//         $('.pagination').text('Fetching more Activity...');
//         return $.getScript(url);
//       }
//     });
//   }
// // });

// jQuery(function() {
//   if ($('.pagination').length) {
// 	   $('#append_and_paginate').prepend('<button id="append_more_results" class="btn btn-primary btn-block m" href="javascript:void(0); ><i class="fa fa-arrow-down"></i> Show More</button>');
//     return $('#append_more_results').click(function() {
//       var url;
//       url = $('.pagination .next_page').attr('href');
//       if (url) {
//         $('.pagination').text('Fetching more Activity...');
//         return $.getScript(url);
//       }
//     });
//   }
// });




// jQuery(function() {
//   return $(window).on('scroll', function() {
//     if ($('.pagination').length) {
//       var url;
//       url = $('.pagination .next_page').attr('href');
//       if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
//         $('.pagination').remove();
//         $('#public_activities').append('<%= j render(@public_activities) %>');
//         return $('#public_activities div').last().load(url, function() {
//           if ($('.next_page.disabled').length) {
//             return $('.pagination').remove();
//           }
//         });
//       }
//     }
//   });
// });
