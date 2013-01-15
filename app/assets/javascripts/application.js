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
//= require jquery
//= require jquery_ujs
//= require jquery.min
//= require jquery.validate
//= require jquery.validate.min
//= require jquery.colorbox.js
//= require jquery.colorbox-min.js
// require bootstrap-alert
//= require_tree .

/* VALIDATION*/
$(document).ready(function() {
    $(".sfg_sign_in").validate({
        rules: {
            "person[email]": {
                required:true,
                email:true
            },
            "person[password]": {
                required:true,
                minlength: 6
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

    $(".sfg_user_sign_up").validate({
        rules: {
            "user[first_name]": {
                required: true
            },
            "user[email]": {
                required: true,
                email: true
            },
            "user[password]": {
                required:true,
                minlength: 6
            },
            "user[password_confirmation]": {
                equalTo: "#user_password"
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

    $(".sfg_business_user_sign_up").validate({
        rules: {
            "business_user[first_name]": {
                required: true
            },
            "business_user[email]": {
                required: true,
                email: true
            },
            "business_user[password]":{
                required:true,
                minlength: 6
            },
            "business_user[password_confirmation]": {
                equalTo: "#business_user_password"
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

    $(".sfg_get_business_details").validate({
        rules: {
            "business_company[business_name]":{
                required: true
            },
            "business_company[description]": {
                minlength: 50
            }
        }
    });

    $("#new_post").validate({
       rules: {
           "post[content]":{
               maxlength: 140
           }
       }
    });

});



//$(function() {
  //  $(document).on('click', '.btn', function () {
  //      var myBookcaseItemId = $(this).data('id');
        // send an AJAX request to fetch the data
  //      $.get(this.href, { id: myBookcaseItemId }, function(data) {
  //          $('#business_popup').html('data').modal('show');
     //   });
   //     return false;
    //});
//});
//$("#new_person").validate();
//$("#new_person").validate({
//    rules: {
//        person[email]: "required"
//},
//messages: {
//    person[email]:"Please enter your firstname"
//},
//submitHandler: function(form) {
//    form.submit();
//}
//
//});
//$("#register-form").validate({
//    rules: {
//        firstname: "required",
//        lastname: "required",
//        email: {
//            required: true,
//            email: true
//        },
//        password: {
//            required: true,
//            minlength: 5
//        },
//        agree: "required"
//    },
//    messages: {
//        firstname: "Please enter your firstname",
//        lastname: "Please enter your lastname",
//        password: {
//            required: "Please provide a password",
//            minlength: "Your password must be at least 5 characters long"
//        },
//        email: "Please enter a valid email address",
//        agree: "Please accept our policy"
//    },
//    submitHandler: function(form) {
//        form.submit();
//    }

/* for lightbox */

//$(function ()
//{ $("#").modal('show');

//});


$(document).ready(function() {

   $('.colorbox').colorbox();

});

$(document).ready(function() {

    $('.colorbox1').colorbox();

});
$(document).ready(function() {

    $('.color_box_create_cause').colorbox();

});
