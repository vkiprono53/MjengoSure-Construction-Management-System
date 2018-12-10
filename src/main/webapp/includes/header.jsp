<%--
  Created by IntelliJ IDEA.
  User: vkiprono
  Date: 9/29/18
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MjengoSure</title>
</head>
<body>

<%
    //Checking if the user is logged in:
    if (session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");

    }
%>

<header class="header dark-bg">
    <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
    </div>

    <!--logo start-->
    <a href="./dashboard.jsp" class="logo">Mjengo <span class="lite">Sure</span></a>
    <!--logo end-->

    <div class="nav search-row" id="top_menu">
        <!--  search form start -->
        <ul class="nav top-menu">
            <li>
                <form class="navbar-form">
                    <input class="form-control" placeholder="Search" type="text">
                </form>
            </li>
        </ul>
        <!--  search form end -->
    </div>

    <div class="top-nav notification-row">
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="./img/avatar.jpg">
                            </span>
                <span class="username"><%= "Welcome " + session.getAttribute("username") %></span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <div class="log-arrow-up"></div>
                <li class="eborder-top">
                    <a href="#" data-toggle="modal" data-target="#myModal"><i class="icon_profile"></i> My Profile</a>
                </li>
                <li>
                    <a href="#"><i class="icon_mail_alt"></i> My Inbox</a>
                </li>
                <li>
                    <a href="login" name="logout"><i class="icon_key_alt"></i> Log Out</a>
                </li>
            </ul>
        </li>
        <!-- notificatoin dropdown end-->
    </div>
</header>
</body>
</html>
