<%--
  Created by IntelliJ IDEA.
  User: vkiprono
  Date: 9/29/18
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<aside>
    <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav">
            <li>
                <a class="" href="./dashboard.jsp">
                    <i class="icon_house_alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="sub-menu">
                <a href="javascript:;" class="">
                    <i class="fa fa-male"></i>
                    <span>Human Resource</span>
                    <span class="menu-arrow arrow_carrot-right"></span>
                </a>
                <ul class="sub" id="nav">
                    <li><a class="createRole" href="./role.jsp">Create Role</a></li>
                    <li></li>
                    <li><a class="" href="./rolesDisplay.jsp" >View Roles</a></li>
                    <li><a class="" href="./employee.jsp">Create Employee</a></li>
                    <li><a class="" href="./employeesDisplay.jsp">View Employees</a></li>

                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" class="">
                    <i class="icon_desktop"></i>
                    <span>Project Mngmt</span>
                    <span class="menu-arrow arrow_carrot-right"></span>
                </a>
                <ul class="sub" id="nav">
                    <li><a class="" href="./project.jsp">Create Project</a></li>
                    <li><a class="" href="./projectsDisplay.jsp">View Projects</a></li>
                    <li><a class="" href="./milestone.jsp">Create Milestone</a></li>
                    <li><a class="" href="./milestonesDisplay.jsp">View Milestone</a></li>
                </ul>
            </li>


            <li class="sub-menu">
                <a href="javascript:;" class="">
                    <i class="icon_table"></i>
                    <span>Resource Mngmt</span>
                    <span class="menu-arrow arrow_carrot-right"></span>
                </a>
                <ul class="sub" id="nav">
                    <li><a class="" href="./products.jsp">Create Products</a></li>
                    <li><a class="" href="./products.jsp">View Products</a></li>
                    <li><a class="" href="./products.jsp">Create Equipments</a></li>
                    <li><a class="" href="./products.jsp">View Equipments</a></li>
                    <li><a class="" href="./products.jsp">Create Machinery</a></li>
                    <li><a class="" href="./products.jsp">View Machinery</a></li>
                </ul>
            </li>

            <li class="sub-menu">
                <a href="javascript:;" class="">
                    <i class="fa fa-cog"></i>
                    <span>Settings</span>
                    <span class="menu-arrow arrow_carrot-right"></span>
                </a>
                <ul class="sub" id="nav">
                    <li><a class="" href="./products.jsp">Define Units</a></li>
                    <li><a class="" href="./products.jsp">CostPerUnit</a></li>
                    <li><a class="" href="./products.jsp">CostPerHour</a></li>
                </ul>
            </li>

        </ul>
        <!-- sidebar menu end-->
    </div>
</aside>
</body>
</html>
