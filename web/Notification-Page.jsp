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
                    <li><img src="images/notification.png"></li>
                    <li><img src="images/inbox.png" ></li>
                    <li><img src="images/video.png"></li> 
                </ul>
            </div>
            <div class="nav-left">
            
                <%
                session=request.getSession(false);
                String pid=(String)session.getAttribute("PersonId");
                String pidS= (String)session.getAttribute("PersonIdSearched");
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
            <form class="search-box" action="Search" method="post">
                        <img src="images/search.png">
                        <input type="text" placeholder="Search" name="search">
            </form>
            
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
                
            </div>
            
            <!-- Main Menu -->
            <div class="Menu">
                
                <div class="write-post-container">
                    <div class="user-profile">
                        <img src="images/<%=pid%>.png">
                        <div>
                            <p><%=fullname%></p>
                            <small>People <i class="fas fa-caret-down"></i></small>
                        </div>
                    </div>
                    
                </div>
                            
                <%
                String mysql1 = "Select Friend_Id from Friend_Table where Person_Id = "+pid+" and request = 'Maybe' ";
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(database, user, password);
                Statement stmn = conn.createStatement();
                ResultSet result1 = stmn.executeQuery(mysql1);
                String nothing = (String)session.getAttribute("Nothonig");
                while (result1.next()){
                    String friend_id = result1.getString(1);
                    session.setAttribute("PersonId_AorD", friend_id);
                %>
                <form class="post-comtainer" action="AcceptOrDeny" method="post">
                    <div class="user-profile">
                        <img src="images/<%=friend_id%>.png">
                        <div>
                            <a href="Profile-Page-Search.jsp">See your profile</a>
                            
                            <button type="submit" name="answer" value="Yes">Yes</button>
                            <button type="submit" name="answer" value="No">No</button>
                        </div>
                    </div>          
                </form>
                <%
                    session.setAttribute("PersonId_Search", friend_id);
                    }
                    conn.close();
                 if (nothing != null) {
                
                %>
                <div class="post-comtainer">
                    <div class="user-profile">
                        <img src="images/null.png">
                        <div>
                            <p><%=nothing%></p>
                        </div>
                </div>
                    
                </div>
                       <% }
                %>
                
                
                
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
                        <h3>10</h3>
                        <span>November</span>
                    </div>
                </div>
            </div>
        </div>
        <%}
        %>
        <script src="Script.js"></script>
        
    </body>
</html>