<%-- 
    Document   : Home-Page
    Created on : Oct 17, 2021, 8:10:39 PM
    Author     : GSSB
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Friend Zone - Home Page</title>
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
                    <%
                    session=request.getSession(false);
                String pid=(String)session.getAttribute("PersonId");
                String database = "jdbc:mysql://localhost:3306/Social?allowPublicKeyRetrieval=true&useSSL=false";
                String user = "root";
                String password = "Silvabeth12";
                String mysql3 = "Select count(Person_Id) from Friend_Table where Person_Id = '"+pid+"' and request = 'Maybe'";
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con3 = DriverManager.getConnection(database, user, password);
                Statement stm3 = con3.createStatement();
                ResultSet result3 = stm3.executeQuery(mysql3);
                int count = 0;
                    if (result3.next()){
                    count = result3.getInt(1);
                    if (count > 0){
                    %>
                    <li><a href="Notification-Page.jsp" style="color: white"><img src="images/notification.png"><%=count%></a></li>
                    <%}
                    else{%>
                    <li><a href="Notification-Page.jsp"><img src="images/notification.png"></a></li>
                    <%}}%>
                    <li><img src="images/inbox.png" ></li>
                </ul>
            </div>
            <div class="nav-left">
            
                <%
                
                String mysql = "Select Full_Name from Reg_Table where Person_Id = '"+pid+"'";
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(database, user, password);
                Statement stm = con.createStatement();
                ResultSet result = stm.executeQuery(mysql);
                if (result.next()){
                String fullname = result.getString(1);
            %>
            <a class="search-box" href="Search-Page.jsp">
                        <img src="images/search.png">
                        <input type="text" placeholder="Search">
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
        
        <div class="Home-Page">
            <!-- Left Hand Side -->
            <div class="LHS">
                <div class="imp-links">
                    <a href=""><img src="images/news.png" style="color: black">Latest News</a>
                    <a href=""><img src="images/friends.png">Friends</a>
                    <a href=""><img src="images/group.png">Groups</a>
                    <a href=""><img src="images/marketplace.png">Marketplace</a>
                    <a href="">See More</a>
                </div>
            </div>
            
            <!-- Main Menu -->
            <div class="Menu">
                
                <div class="write-post-container">
                    <div class="user-profile">
                        <img src="images/<%=pid%>.png">
                        <div>
                            <p><%=fullname%></p>
                            <small>Public <i class="fas fa-caret-down"></i></small>
                        </div>
                    </div>
                    <!-- Carry on 1:2c:1c 
                    <textarea rows="3" placeholder="Tell us your store" id="Post"></textarea>-->
                    
                    <form class="post-input-container" action="Post" method="post" id="post-form">
                            <input type="text" name="post" placeholder="Tell us your store" row="3">
                        <div class="add-post-links">
                            <button id="btn-post"><img src="images/post.png">Post</button>
                        </div>
                        </form>
                        
                </div>
                            
                <%
                String mysql1 = "Select Post, Date from Post_Table where Person_Id = '"+pid+"' order by Post_Id desc";
                
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
                        <img src="images/<%=pid%>.png">
                        <div>
                            <p><%=fullname%></p>
                            <span><%=date%></span>
                        </div>
                        </div>
                        <a href=""><i class="fas fa-ellipsis-v"></i></a>
                    </div>
                    
                    <p class="post-text"><%=post%><a href=""> #GSSB Crazy</a></p>
                    
                    
                    <div class="post-row">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png"> 0</div>
                            <div><img src="images/comments.png"> 4</div>
                            <div><img src="images/share.png"> 2</div>
                        </div>
                        <div class="post-profile-icon">
                            <img src="images/<%=pid%>.png">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                <%}
                conn.close();

                String mysql4 = "select Post_Table.Post, Post_Table.Date, "
                +"Reg_Table.Full_Name, Reg_Table.Person_Id from Post_Table "
                +"inner join Friend_Table on Post_Table.Person_Id = "
                +"Friend_Table.Friend_Id inner join Reg_Table on "
                +"Post_Table.Person_Id = Reg_Table.Person_Id where "
                +"Friend_Table.Person_Id = "+pid+" and "+
                "Friend_Table.request = 'Yes' order by Post_Table.Post_Id desc;";
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn4 = DriverManager.getConnection(database, user, password);
                Statement stmn4 = conn4.createStatement();
                ResultSet result4 = stmn4.executeQuery(mysql4);
                while (result4.next()){
                String post = result4.getString(1);
                String date = result4.getString(2);
                String fname = result4.getString(3);
                String pp = result4.getString(4);
                %>
                
                <div class="post-comtainer">
                    <div class="post-row">
                        <div class="user-profile">
                        <img src="images/<%=pp%>.png">
                        <div>
                            <p><%=fname%></p>
                            <span><%=date%></span>
                        </div>
                        </div>
                        <a href=""><i class="fas fa-ellipsis-v"></i></a>
                    </div>
                    
                    <p class="post-text"><%=post%><a href=""> #GSSB Crazy</a></p>
                    
                    
                    <div class="post-row">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png"> 0</div>
                            <div><img src="images/comments.png"> 4</div>
                            <div><img src="images/share.png"> 2</div>
                        </div>
                        <div class="post-profile-icon">
                            <img src="images/<%=pid%>.png">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                            
                <%} conn4.close();%>
                
                <button type="button" class="load-more-btn">Load More</button>
            </div>
            
            <!-- Right Hand Side -->
            <div class="RHS">
                <div class="sidebar-title">
                    <h4>Events</h4>
                    <a href="">See All</a>
                </div>
                
                <div class="event">
                    <div class="L-event">
                        <h3>18</h3>
                        <span>March</span>
                    </div>
                    <div class="R-event">
                        <h4>Social Media</h4>
                        <p><i class="fas fa-map-marked-alt"></i> G Bete</p>
                        <a href="">More Info</a>
                    </div>
                </div>
                <div class="event">
                    <div class="L-event">
                        <h3>22</h3>
                        <span>March</span>
                    </div>
                    <div class="R-event">
                        <h4>Mobile</h4>
                        <p><i class="fas fa-map-marked-alt"></i> G Bete</p>
                        <a href="">More Info</a>
                    </div>
                </div>
                
                <div class="sidebar-title">
                    <h4>Ads</h4>
                    <a href="">Close</a>
                </div>
                <img src="images/advertisement.png" class="sidebar-ads">
                
            </div>
        </div>
        <%}
        %>
        <script src="Script.js"></script>
        
    </body>
</html>
