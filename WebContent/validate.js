/**
 * 
 */
function validateRadio1(){
    	   var valid  = false;
           var x = document.radioform1.r;
           for(var i = 0 ; i < x.length ; i++){
               if(x[i].checked){
                   valid = true;
                   break;
               }
           }
           if(valid){
              // alert("Successs");
               //return true;
           }
           else{
               alert("Please select a mode")
               return false;
           }
    }
function validateRadio2(){
    	   var valid  = false;
           var x = document.radioform2.r;
           for(var i = 0 ; i < x.length ; i++){
               if(x[i].checked){
                   valid = true;
                   break;
               }
           }
           if(valid){
              // alert("Successs");
               return true;
           }
           else{
               alert("Please select a mode")
               return false;
           }
    }
function validateRadio3(){
    	   var valid  = false;
           var x = document.radioform3.r;
           for(var i = 0 ; i < x.length ; i++){
               if(x[i].checked){
                   valid = true;
                   break;
               }
           }
           if(valid){
              // alert("Successs");
               return true;
           }
           else{
               alert("Please select a mode")
               return false;
           }
    }

    function validateRadio4(){
    	   var valid  = false;
           var x = document.radioform4.r;
           for(var i = 0 ; i < x.length ; i++){
               if(x[i].checked){
                   valid = true;
                   break;
               }
           }
           if(valid){
              // alert("Successs");
               return true;
           }
           else{
               alert("Please select a mode")
               return false;
           }
    }

function validateRadio5(){
    	   var valid  = false;
           var x = document.radioform5.r;
           for(var i = 0 ; i < x.length ; i++){
               if(x[i].checked){
                   valid = true;
                   break;
               }
           }
           if(valid){
              // alert("Successs");
               //return true;
           }
           else{
               alert("Please select a mode")
               return false;
           }
    }
 function validateSignUp(){
        var name = document.getElementById("name");
        var username = document.getElementById("username");
        var mobile = document.getElementById("mobile");
		var email = document.getElementById("email");

        var valid  = false;
        var x = document.signUp.r;
        for(var i = 0 ; i < x.length ; i++){
            if(x[i].checked){
                valid = true;
                break;
            }
        }
        if(valid && (name.value!=""&&username.value!=""&&mobile.value!=""&&email.value!="")){
           // alert("Successs");
            return true;
        }
        else{
            alert("Please no blanks")
            return false;
        }
    }
  function validateSearch(){
		//var location = document.getElementById("location");
        var from = document.getElementById("from");
        var to = document.getElementById("to");
		//var adults = document.getElementById("adults");
		//var children = document.getElementById("children");
		if( from.value==""|| to.value==""){
            alert("No blanks allowed");
            return false;
        }
        else{
            return true;
        }
}
 function validateUpdateUserInfo(){
        var name = document.getElementById("name");
        var username = document.getElementById("username");
        var mobile = document.getElementById("mobile");
		var password = document.getElementById("password");
		var email = document.getElementById("email");
		var type = document.getElementById("type");
        
        if(type.value=="" || name.value==""||password.value==""||mobile.value==""||username.value==""||email.value==""){
           
           alert("Please no blanks")
            return false;
        }
        else{
	    	alert("Updated Successsfully");
            return true;
        }
    }
    
    
    