<%@ page import="com.kiprono.hr.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kiprono.hr.enums.AccessLevel" %>
<%@ page import="com.kiprono.hr.model.Employee" %>
<%@ page import="com.kiprono.projectManagement.model.Project" %>
<%--<!DOCTYPE html>
<html lang="en">


<%@include file="includes/bootstrap.jsp"%>
<body>
<!-- container section start -->
<section id="container" class="">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/sidebar.jsp"%>--%>

    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="dashboard.jsp">Home</a></li>
                        <li><i class="fa fa-laptop"></i>project</li>
                    </ol>
                </div>
            </div>

            <!-- Project -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Add Project
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                    <form class="form-horizontal" id="form_members" role="form" action="projectServlet" method="post">
                                    <div class="form-group ">
                                        <label for="projectName" class="control-label col-lg-2">projectName:<span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" name="projectName" id="projectName" placeholder="Enter the projectName"
                                                    minlength="5" type="text" required/>
                                        </div>
                                    </div>

                                        <div class="form-group ">
                                            <label for="projectDescription" class="control-label col-lg-2">projectDescription:<span
                                                    class="required">*</span></label>
                                            <div class="col-lg-10">
                                                <input class="form-control" name="projectDescription" id="projectDescription" placeholder="Enter the projectDescription"
                                                       minlength="10" type="text" required/>
                                            </div>
                                        </div>


                                    <div class="form-group ">
                                        <label for="projectLocation" class="control-label col-lg-2">projectLocation: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="projectLocation" id="projectLocation"
                                                   placeholder="Enter the projectLocation" required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="projectCity" class="control-label col-lg-2">projectCity: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="projectCity" id="projectCity"
                                                   placeholder="Enter the projectCity" required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="projectCountry" class="control-label col-lg-2">projectCountry: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="projectCountry" id="projectCountry"
                                                   placeholder="Enter the projectCountry" required>
                                        </div>
                                    </div>

                                        <div class="form-group ">
                                            <label for="expectedStartDate" class="control-label col-lg-2">expectedStartDate: <span
                                                    class="required">*</span></label>
                                            <div class="col-lg-10">
                                                <input type="date" class="form-control" name="expectedStartDate" id="expectedStartDate"
                                                        required>
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label for="expectedEndDate" class="control-label col-lg-2">expectedEndDate: <span
                                                    class="required">*</span></label>
                                            <div class="col-lg-10">
                                                <input type="date" class="form-control" name="expectedEndDate" id="expectedEndDate"
                                                       required>
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label for="expectedDuration" class="control-label col-lg-2">expectedDuration: <span
                                                    class="required">*</span></label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" name="expectedDuration" id="expectedDuration"
                                                       placeholder="Enter the expectedDuration">
                                            </div>
                                        </div>

                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">

                                            <button type="submit" class="btn btn-info btn-md" name="button" id="saveButton"
                                                    value="saveButton">Save
                                            </button>

                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </section>
                </div>
            </div>
            <br>
            <hr>
            <h3>Existing Projects: </h3>
            <table class="table table-striped" border="1">
                <tr>
                    <th>projectName:</th>
                    <th>projectDesc:</th>
                    <th>projectCountry:</th>
                    <th>expectedDuration:</th>
                    <th>Update</th>
                    <th>Delete</th>
                    <th>Milestones:</th>
                </tr>
                <tr>
                    <%
                        try {
                            List<Project> projects = (List<Project>) session.getAttribute("projects");
                            if (projects != null) {
                                for (Project projectList : projects) { %>
                    <td><%= projectList.getProjectName() %></td>
                    <td><%= projectList.getProjectDescription() %> </td>
                    <td><%= projectList.getProjectCountry() %></td>
                    <td><%= projectList.getExpectedDuration() %> </td>
                    <td>
                        <a>
                            <form action="projectServlet" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" value="<%= projectList.getId() %>">
                                    <button type="submit" class="btn btn-info" name="button" id="updateButton"
                                            value="updateButton">Update
                                    </button>
                                </div>
                            </form>
                        </a>
                    </td>
                    <td>
                        <a>
                            <form action="projectServlet" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" value="<%= projectList.getId() %>">
                                    <button type="submit" onclick="window.alert('Do you want to delete?')"
                                            class="btn btn-danger" name="button" id="deleteButton" value="deleteButton">
                                        Delete
                                    </button>
                                </div>
                            </form>
                        </a>
                    </td>

                    <td>
                        <a>
                            <form action="projectServlet" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" value="<%= projectList.getId() %>">
                                    <button type="submit" onclick="window.alert('Do you want to delete?')"
                                            class="btn btn-danger" name="button" id="deleteButton" value="deleteButton">
                                        Delete
                                    </button>
                                </div>
                            </form>
                        </a>
                    </td>

                </tr>
                <%
                        }
                    } %>

                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {

                    }
                %>
            </table>

            <br><br>
        </section>
    </section>
<%--<%@include file="includes/footer.jsp"%>
    </section>
    <!--main content end-->
</section>
<!-- container section start -->

<!-- javascripts -->
<%@include file="includes/javascript.jsp"%>

</body>

</html>--%>
