<%-- 
    Document   : Login-Page
    Created on : Oct 17, 2021, 8:10:39 PM
    Author     : GSSB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Login.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <title>Login Form</title>
    </head>
    <body>
        <div class="Try-Page">
            <div class="Item LHS">
                <h1>Friend Zone</h1><br><br>
                <h3>Come and tell your story</h3>
            </div>
            
            <%
                        session=request.getSession(false);
                        String error=(String)session.getAttribute("error"); 
                        String check=(String)session.getAttribute("check");
                        if(check=="True"){%>
            <div class="Item RHS">
                <label>Login</label><br><br>
                <form action="Login" method="post" onsubmit="return checkforblack()">
                <label class="LogT">Email</label><br>
                <input type="text" name="user_name" placeholder="Enter your User Name" id="userN"><br>
                <label class="LogT">Password</label><br>
                <input style="color: black" type="password" name="password" placeholder="Password" id="passW">
                <input type="submit" value="Login">
                </form>
                <p style="font-size: 20px; color: red" href=""><%=error%></p><br>
                <a style="font-size: 20px; color: gray" href="">Forgot Password</a><br>
                <label class="LogT">Do you have a account?</label>
                <a style="font-size: 20px; color: blue" href="SignUp-Page.jsp">Sign-up</a>
            </div>
                <%
                }else{
                %>
            <div class="Item RHS">
                <label>Login</label><br><br>
                <form action="Login" method="post" onsubmit="return checkforblack()">
                <label class="LogT">User Name</label><br>
                <input type="text" name="user_name" placeholder="Enter your User Name" id="userN" style="color: black"><br>
                <label class="LogT">Password</label><br>
                <input type="password" name="password" placeholder="Password" id="passW" style="color: black">
                <input type="submit" value="Login">
                </form>
                <a style="font-size: 20px; color: gray" href="">Forgot Password</a><br>
                <label class="LogT">Do you have a account?</label>
                <a style="font-size: 20px; color: blue" href="SignUp-Page.jsp">Sign-up</a>   
            </div>
                <%}%>
            <div class="Item F">
                3
            </div>
        </div>
        <script>
            function checkforblack(){
                var check = true;
                var mail_format = /^(.+)@(.+)$/;
                var user = document.getElementById('userN').value;
                var password = document.getElementById('passW').value;
                if (check){
                    if (user.match(mail_format)){
                    }
                    else{
                        check = false;
                        alert("Please Enter a Email");
                        document.getElementById('userN').style.border= "2px solid red";
                    }
                    if (user === "") {
                    document.getElementById('userN').style.border= "2px solid red";
                    alert(document.getElementById('userN').value.match(mail_format));
                    check = false;
                    }
                    
                    if (password === ""){
                    document.getElementById('passW').style.border= "2px solid red";
                    check = false;  
                    }
                return check;
                }
                
            }
        </script>
    </body>
</html>
