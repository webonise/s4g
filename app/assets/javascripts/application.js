
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
//= require jquery.validate.js
//= require jquery.colorbox.js
//= require bootstrap
//= require_tree .

/* VALIDATION*/
$(document).ready(function() {
    $("#new_person").validate({
        rules: {
            "person[email]": {
                required:true,
                email:true
            },
            "person[password]": {
                required:true,
                minlength: 6
            }
        }
    });

//    $(".sfg_user_sign_up").validate({
//        rules: {
//            "user[first_name]": {
//                required: true
//            },
//            "user[email]": {
//                required: true,
//                email: true
//            },
//            "user[password]": {
//                required:true,
//                minlength: 6
//            },
//            "user[password_confirmation]": {
//                equalTo: "#user_password"
//            }
//        },
//        submitHandler: function(form) {
//            form.submit();
//        }
//    });

//    $(".sfg_business_user_sign_up").validate({
//        rules: {
//            "business_user[first_name]": {
//                required: true
//            },
//            "business_user[email]": {
//                required: true,
//                email: true
//            },
//            "business_user[password]":{
//                required:true,
//                minlength: 6
//            },
//            "business_user[password_confirmation]": {
//                equalTo: "#business_user_password"
//            }
//        },
//        submitHandler: function(form) {
//            form.submit();
//        }
//    });

//    $(".sfg_get_business_details").validate({
//        rules: {
//            "business_company[business_name]":{
//                required: true
//            },
//            "business_company[description]": {
//                minlength: 50
//            }
//        }
//    });

//    $("#new_post").validate({
//        rules: {
//            "post[content]":{
//                maxlength: 140
//            }
//        }
//    });


    $(".sfg_edit_cause").validate({
        rules: {
            "cause[cause_name]":{
                required: true,
                maxlength:50
            },
            "cause[url]": {
                url:true
            },
            "cause[logo]":{
                required:true
            },
            "cause[contact_no]":{
                required:true,
                digits: true ,
                minlength:10,
                maxlength: 10
            }

        }
    });

    $(".sfg_admin_business").validate({
        rules: {
            "business_company[business_name]":{
                required: true,
                maxlength:50
            },
            "business_company[business_website]": {
                url:true
            },
            "business_company[business_logo]":{
                required:true
            },
            "business_company[contact]":{
                required:true,
                digits: true ,
                minlength:10,
                maxlength: 10
            }

        }
    });


    $('#sfg_color_box').colorbox();
    $('.color_box_create_cause').colorbox();
    $('#sfg_view_popup').colorbox();
    $('.color_box_view_cause').colorbox();
    $('.dropdown-toggle').dropdown()
});
