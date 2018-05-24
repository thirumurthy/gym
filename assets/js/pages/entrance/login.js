$(document).ready(function(){
    $(".submit-button.correct").click(function(){

        
        var postdata = { username : $('input[id="username"]').val(), password : $('input[id="pwd"]').val() };
        $.post( "/api/v1/user/login",postdata, function( data ) {
            if(data && data ==1)
            {

                $(".input-fields").addClass("run-ani");
                setTimeout(function(){
                    $(".submit-section").addClass("run-ani");
                }, 300);

                setTimeout(function(){
                    $("#success-tick").addClass("run-ani");
                }, 1100);

                setTimeout(function(){
                    $("span.success-text").addClass("run-ani");
                    window.location.href = "/welcome";
                }, 1300);

               
            }
            else
            {
                $( "#loginerr" ).removeClass( "d-none" );

            }
            console.log(data);
          });

       

    });
  
    $(".submit-button.correct").click(function(){
        
    });
  
    $(".submit-button.correct").click(function(){
        
    });
  
    $(".submit-button.correct").click(function(){
       
    });

    $(".code-rerun").click(function(){
        $(".input-fields, .submit-section").removeClass("run-ani");
    });
  
    $(".code-rerun").click(function(){
        $("#success-tick").removeClass("run-ani");
    });
  
    $(".code-rerun").click(function(){
        $("span.success-text").removeClass("run-ani");
    });
});