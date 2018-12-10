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
<%--        <%@include file="includes/footer.jsp"%>
    </section>
    <!--main content end-->
</section>
<!-- container section start -->

<!-- javascripts -->
<%@include file="includes/javascript.jsp"%>

</body>

</html>--%>
