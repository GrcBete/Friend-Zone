<%-- 
    Document   : Home-Page
    Created on : Oct 17, 2021, 8:10:39 PM
    Author     : GSSB
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Friend Zone - Profile Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <script src="https://kit.fontawesome.com/74d46cec90.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav>
            <div class="nav-left">
                <a href="Home-Page.jsp"><h1>Friend Zone</h1></a>
                <ul>
                    <li><a href=""><img src="images/notification.png"></a></li>
                    <li><img src="images/inbox.png" ></li>
                </ul>
            </div>
            
            
            <%
                session=request.getSession(false);
                String pid=(String)session.getAttribute("PersonId");
                String person_id = (String)session.getAttribute("PersonId_Search");
                String database = "jdbc:mysql://localhost:3306/Social?allowPublicKeyRetrieval=true&useSSL=false";
                String user = "root";
                String password = "Silvabeth12";
                String mysql = "Select Full_Name from Reg_Table where Person_Id = '"+pid+"'";
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(database, user, password);
                Statement stm = con.createStatement();
                ResultSet result = stm.executeQuery(mysql);
                if (result.next()){
                String fullname = result.getString(1);
            %>
            
            <div class="nav-left">
                
                <a class="search-box" href="Search-Page.jsp">
                    <img src="images/search.png">
                    <input type="text" placeholder="Search" name="search">
                    </a>
                
                <div class="nav-user-icon online" onclick="settingMenuToggle()">
                    <img src="images/<%=pid%>.png">
                </div>
            </div>
            <div class="setting-menu">
                <div class="setting-menu-inner">
                    <div class="user-profile">
                        <img src="images/<%=pid%>.png">
                        <div>
                            <p><%=fullname%></p>
                            <a href="Profile-Page.jsp">See your profile</a>
                        </div>
                </div>
                <hr>
                <div class="user-profile">
                        <img src="images/feedback.png">
                        <div>
                            <p>Give Feedback</p>
                            <a href="">Help us improve more</a>
                        </div>
                </div>
                <hr>
                <div class="setting-links">
                    <img src="images/setting.png" class="setting-icon">
                    <a href="">Setting & Privacy <img src="images/arrow.png" style="width: 10px"></a>
                </div>
                
                <div class="setting-links">
                    <img src="images/help.png" class="setting-icon">
                    <a href="">Help and Support <img src="images/arrow.png" style="width: 10px"></a>
                </div>
                
                <div class="setting-links">
                    <img src="images/display.png" class="setting-icon">
                    <a href="">Display and Accessibility <img src="images/arrow.png" style="width: 10px"></a>
                </div>
                
                <div class="setting-links">
                    <img src="images/logout.png" class="setting-icon">
                    <a href="SignOut">Logout <img src="images/arrow.png" style="width: 10px"></a>
                </div>
                </div>
                
            </div>
        </nav>
                            <%}
                String mysql2 = "Select Full_Name from Reg_Table where Person_Id = '"+person_id+"'";
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn2 = DriverManager.getConnection(database, user, password);
                Statement stmn2 = conn2.createStatement();
                ResultSet result2 = stmn2.executeQuery(mysql2);
                String funame =null;
                if (result2.next()){
                funame = result2.getString(1);
        %>
        
        <div class="profile-container">
            <img src="images/cover.png" class="cover-img">
            <div class="profile-details">
                <div class="pd-left">
                    <div class="pd-row">
                        <img src="images/<%=person_id%>.png" class="pd-image">
                        <div>
                            <h3><%=funame%></h3>
                            
                            <p>2 Friends - 1 Mutual</p>
                            <img src="images/member-1.png">
                            <img src="images/member-2.png">
                            <img src="images/member-3.png">
                        </div>
                    </div>
                </div>
                
                <div class="pd-right">
                    <form action="Follow" method="post" onsubmit="return checkforblack()">
                        <button type="submit" id="request"><img src="images/add-friends.png">Follow</button>
                    </form>
                    <button type="button"><img src="images/message.png">Message</button>
                    <br>
                    <a><img src="images/more.png"></a>
                </div>
            </div>
            
            
            <div class="profile-info">
                <div class="info-col">
                    <div class="profile-intro">
                        <h3>Intro</h3>
                        <p class="intro-text">Believe in yourself and you can do
                          unbelievable things.<img src="images/feeling.png"></p>
                        <hr>
                        <ul>
                            <li><img src="images/profile-study.png">Student of Eng Computer</li>
                            <li><img src="images/profile-study.png">Good at Delphi</li>
                        </ul>
                    </div>
                    
                    <div class="profile-intro">
                        <div class="title-box">
                            <h3>Photos</h3>
                            <a href="">All Photos</a>
                        </div>
                        
                        <div class="photo-box">
                            <div><img src="images/photo1.png"></div>
                            <div><img src="images/photo2.png"></div>
                            <div><img src="images/photo3.png"></div>
                        </div>
                    </div>
                    
                    <div class="profile-intro">
                        <div class="title-box">
                            <h3>Friends</h3>
                            <a href="">All Friends</a>
                        </div>
                        <p>2 (1 mutual)</p>
                        <div class="friends-box">
                            <div><img src="images/member-1.png">Jess</div>
                            <div><img src="images/member-2.png">Nigga</div>
                        </div>
                    </div>
                    
                    
                </div>
                <div class="post-col">
                     <div class="write-post-container">
                    <div class="user-profile">
                        <img src="images/<%=person_id%>.png">
                        <div>
                            <p><%=funame%></p>
                            <small>Public <i class="fas fa-caret-down"></i></small>
                        </div>
                    </div>
                    
                       
                        
                </div>
                            
                  <%}
                String mysql1 = "Select Post, Date from Post_Table where Person_Id = '"+person_id+"' order by Post_Id desc";
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(database, user, password);
                Statement stmn = conn.createStatement();
                ResultSet result1 = stmn.executeQuery(mysql1);
                while (result1.next()){
                    String post = result1.getString(1);
                    String date = result1.getString(2);
                %>
                <div class="post-comtainer">
                    <div class="post-row">
                        <div class="user-profile">
                        <img src="images/<%=person_id%>.png">
                        <div>
                            <p><%=funame%></p>
                            <span><%=date%></span>
                        </div>
                        </div>
                        <a href=""><i class="fas fa-ellipsis-v"></i></a>
                    </div>
                    
                    <p class="post-text"><%=post%><a href=""> #GSSB Crazy</a></p>
                    
                    <div class="post-row">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png"> 1</div>
                            <div><img src="images/comments.png"> 4</div>
                            <div><img src="images/share.png"> 2</div>
                        </div>
                        <div class="post-profile-icon">
                            <img src="images/<%=person_id%>.png">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                            
                            <%}
                            conn.close();%>
                </div>
                
            </div>
        </div>
        
        <div class="footer">
            <p>Copyright GSSB copied </p>
        </div>
        <script src="Script.js"></script>
        <script>
            function checkforblack(){
                var check = false;
                if (check){
                    if (document.getElementById('request').clicked === true) {
                    document.getElementById('request').style.color= "black";
                    check = true;
                    }
                return = check;
                }
            }
        </script>
        
    </body>
</html>
