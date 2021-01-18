/*// SIGN UP PAGE
    //Captcha*/
    function Cap(){
        var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        var letter=alpha[Math.floor(Math.random()*alpha.length)];
        for(var i=0 ; i < 6 ; i++){
        letter=letter+alpha[Math.floor(Math.random()*alpha.length)];
        }
        document.getElementById("captchaRead").value=letter;
        //contactForm.captchaRead.value = letter;
    }
    function validCap(){
        var str1=document.getElementById("captchaRead").value;
        var str2=document.getElementById("captchaWrite").value;
        if(str1 != str2 && str2.length >0){
        Cap();
        alert("Please enter a valid captcha");
        
        return false;
        }
    }
    function initialize() 
    { 
        $('#refresh').click(); 
    } 
   
/*
// SIGN IN PAGE
    // showing password*/
    function showPassword() {
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }

  /*  // ajax */
//   var username = document.getElementById("username").value;
//    var password = document.getElementById("password").value;
//    function ajaxValidation() {
//        var xhttp = new XMLHttpRequest();
//        xhttp.open("GET", "validateInfoServlet?username=" + username + "& password="+ password, true);
//        xhttp.send();
//
//        xhttp.onreadystatechange = function() {
//            if (this.readyState == 4 && this.status == 200) {
//                document.getElementById("show").innerHTML = this.responseText;
//            }
//        }
//
//    }
    
    
/*show for admin ONLY*/
function show(){
    var usertype = document.querySelector('input[name="type"]:checked').value;
    if(usertype==="admin"){
        document.getElementById('show-for-admin').style.display='block';
    }
    else if(usertype==="client"){
        document.getElementById('show-for-admin').style.display='none';
    }
}