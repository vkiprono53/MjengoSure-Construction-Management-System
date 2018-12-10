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

    <!--main content start-->
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
            <!-- Employee -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Update Project
                        </header>
                        <div class="panel-body">
                            <%
                                try {
                                    Project project = (Project) session.getAttribute("projectEdit");

                            %>
                            <div class="form">
                                <form class="form-horizontal" id="form_members" role="form" action="projectServlet" method="post">
                                    <div class="form-group ">
                                        <label for="id" class="control-label col-lg-2">ProjectId:<span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" value="<%= project.getId() %>" name="id" id="id"
                                                   type="hidden" required/><%=project.getId()%>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="projectName" class="control-label col-lg-2">projectName:<span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" value="<%= project.getProjectName()%>" name="projectName" id="projectName" placeholder="Enter the projectName"
                                                  type="text" required/>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="projectDescription" class="control-label col-lg-2">projectDescription:<span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" name="projectDescription" id="projectDescription" value="<%= project.getProjectDescription()%>"
                                                   minlength="10" type="text" required/>
                                        </div>
                                    </div>


                                    <div class="form-group ">
                                        <label for="projectLocation" class="control-label col-lg-2">projectLocation: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" value="<%= project.getProjectLocation()%>" name="projectLocation" id="projectLocation"
                                                    required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="projectCity" class="control-label col-lg-2">projectCity: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="projectCity" id="projectCity"
                                                   value="<%=project.getProjectCity()%>" required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="projectCountry" class="control-label col-lg-2">projectCountry: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="projectCountry" id="projectCountry"
                                                   value="<%=project.getProjectCountry()%>" required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="expectedStartDate" class="control-label col-lg-2">expectedStartDate: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="date" class="form-control" value="<%=project.getExpectedStartDate()%>" name="expectedStartDate" id="expectedStartDate"
                                                   required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="expectedEndDate" class="control-label col-lg-2">expectedEndDate: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="date" class="form-control" value="<%=project.getExpectedEndDate()%>" name="expectedEndDate" id="expectedEndDate"
                                                   required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="expectedDuration" class="control-label col-lg-2">expectedDuration: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="expectedDuration" id="expectedDuration"
                                                   value="<%=project.getExpectedDuration()%>">
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="actualStartDate" class="control-label col-lg-2">actualStartDate: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="date" class="form-control" value="<%=project.getActualStartDate()%>" name="actualStartDate" id="actualStartDate"
                                                   required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="actualEndDate" class="control-label col-lg-2">actualEndDate: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="date" class="form-control" value="<%= project.getActualEndDate()%>" name="actualEndDate" id="actualEndDate"
                                                   required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="actualDuration" class="control-label col-lg-2">actualDuration: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="actualDuration" id="actualDuration"
                                                   value="<%=project.getActualDuration()%>">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <button type="submit" class="btn btn-info btn-md" name="button" id="updatingButton" value="updatingButton">Update</button>
                                        </div>
                                    </div>
                                    <%
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {

                                        }
                                    %>
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
                    <th>projectCountry:</th>
                    <th>expectedDuration:</th>
                    <th>actualDuration:</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <tr>
                    <%
                        try {
                            List<Project> projects = (List<Project>) session.getAttribute("projects");
                            if (projects != null) {
                                for (Project projectList : projects) { %>
                    <td><%= projectList.getProjectName() %></td>
                    <td><%= projectList.getProjectCountry() %> </td>
                    <td><%= projectList.getExpectedDuration() %></td>
                    <td><%= projectList.getActualDuration() %> </td>
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
            </div>
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
