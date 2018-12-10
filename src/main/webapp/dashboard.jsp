<%@ page import="com.kiprono.projectManagement.model.Project" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kiprono.projectManagement.model.Milestone" %>
<%@ page import="com.kiprono.hr.model.Employee" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="includes/bootstrap.jsp" %>

</head>

<body>
<!-- container section start -->
<section id="container" class="">
    <%@include file="includes/header.jsp" %>
    <%@include file="includes/sidebar.jsp" %>
    <!--sidebar end-->
    <!--main content start-->

    <div id="content">
        <section id="main-content">
            <section class="wrapper">
                <!--overview start-->
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
                        <ol class="breadcrumb">
                            <li><i class="fa fa-home"></i><a href="dashboard.jsp">Home</a></li>
                            <li><i class="fa fa-laptop"></i>Dashboard</li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box blue-bg">
                            <i class="icon_documents_alt"></i>
                            <div class="count">

                                <%
                                    List<Project> projects = (List<Project>) session.getAttribute("projects");

                                %>
                                <%=projects.size()%>

                            </div>
                            <div class="title">Projects</div>
                        </div>
                        <!--/.info-box-->
                    </div>
                    <!--/.col-->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box brown-bg">
                            <i class="icon_toolbox_alt"></i>
                            <div class="count">
                                <%
                                    List<Milestone> milestones = (List<Milestone>) session.getAttribute("milestones");
                                %>
                                <%=milestones.size()%>

                            </div>
                            <div class="title">Milestones</div>
                        </div>
                        <!--/.info-box-->
                    </div>
                    <!--/.col-->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box dark-bg">
                            <i class="icon-task-l"></i>
                            <div class="count">100</div>
                            <div class="title">Tasks</div>
                        </div>
                        <!--/.info-box-->
                    </div>
                    <!--/.col-->

                    <!--/.col-->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box brown-bg">
                            <i class="fa fa-male"></i>
                            <div class="count">
                                <%
                                    List<Employee> employees = (List<Employee>) session.getAttribute("employees");
                                %>
                                <%=employees.size()%>

                            </div>
                            <div class="title">Employees</div>
                        </div>
                        <!--/.info-box-->
                    </div>


                </div>


            </section>

        </section>
        <!--main content end-->
    </div>
</section>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<%@include file="includes/footer.jsp" %>
<!-- container section start -->
<%@include file="includes/javascript.jsp" %>
<script src="./includes/general.js">

</script>

</body>

</html>
