<%-- 
    Document   : SignUp-Page
    Created on : Oct 17, 2021, 10:07:10 PM
    Author     : GSSB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Sign-Up.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <title>Sign-Up Form</title>
    </head>
    <body>
        <div class="Sign-up-Page">
        <div class="Item Header">
            <a href="Login-Page.jsp">Home</a>
            <a href="">about</a>
            <a href="">Language: English</a>
        </div>
        <div class="Item Main-Form">
            <label>Create your account</label><br><br>
            <form action="Sign" method="post" onsubmit="return checkforblack()">
            <label class="LogT">First Name</label><br>
            <input type="text" name="first_name" placeholder="Enter your First Name" id="firstN" style="color: black">
            <br>
            <label class="LogT">Surname</label><br>
            <input type="text" name="surname" placeholder="Enter your Surname" id="surN" style="color: black">
            <br>
            <label class="LogT">Email</label><br>
            <input type="text" name="email" placeholder="Enter your Email"  id="email" style="color: black">
            <br>
            <label class="LogT">Date of Birth</label><br>
            <input type="date" name="date_of_birth"  id="datet" style="color: black">
            <br>
            <label class="LogT">Password</label><br>
            <input type="text" name="password" placeholder="Enter your Password" id="passW" style="color: black">
            <br>
            <label class="LogT">Confirm Password</label><br>
            <input type="text" placeholder="Enter your Password once again" id="cpassW" style="color: black">
            <br>
            <input type="submit" value="Sign-up">
            </form>
            <br><br><br>
            <label class="LogT">Already have an account</label>
            <a style="font-size: 20px; color: blue" href="">Login</a>
        </div>
        </div>
        <script>
            function checkforblack(){
                var check = true;
                var letters = /^[A-Za-z]+$/;
                var mail_format = /^(.+)@(.+)$/;
                var fname = document.getElementById('firstN').value;
                var sname = document.getElementById('surN').value;
                var email = document.getElementById('email').value;
                if (check){
                    if (fname.match(letters)) {
                    }else{
                        document.getElementById('firstN').style.border= "2px solid red";
                        check = false;
                        return check;
                    }
                    if (sname.match(letters)) {
                    }else{
                        document.getElementById('surN').style.border= "2px solid red";
                        check = false;
                        return check;
                    }
                    if (fname === "") {
                    document.getElementById('firstN').style.border= "2px solid red";
                    check = false;
                    return check;
                    }
                    
                    if (sname === "")  {
                    document.getElementById('surN').style.border= "2px solid red";
                    check = false;
                    return check;
                    }
                    if (email.match(mail_format)){
                    }
                    else{
                        check = false;
                        alert("Please Enter a Email");
                        document.getElementById('email').style.border= "2px solid red";
                        return check;
                    }
                    if (email === "")  {
                    document.getElementById('email').style.border= "2px solid red";
                    check = false;
                    return check;
                    }
                    if (document.getElementById('cpassN').value === "") {
                    document.getElementById('cpassN').style.border= "2px solid red";
                    check = false;
                    return check;
                    }
                    
                    if (document.getElementById('passN').value === "")  {
                    document.getElementById('passN').style.border= "2px solid red";
                    check = false;
                    return check;
                    }
                    
                    if (document.getElementById('cpassN').value !== document.getElementById('passW').value) {
                    document.getElementById('cpassN').style.border= "2px solid red";
                    document.getElementById('passW').style.border= "2px solid red";
                    check = false;
                    return check;
                    }
                    
                    if (document.getElementById('datet').value === ""){
                        alert(document.getElementById('date').value);
                    document.getElementById('date').style.border= "2px solid red";
                    check = false; 
                    return check;
                    }
                return check;
                }
                
            }
        </script>
    </body>
</html>
