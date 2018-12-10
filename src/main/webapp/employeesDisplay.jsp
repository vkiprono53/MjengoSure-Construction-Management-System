<%@ page import="com.kiprono.hr.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kiprono.hr.enums.AccessLevel" %>
<%@ page import="com.kiprono.hr.model.Employee" %>
<%@ page import="com.kiprono.hr.model.User" %>
<%--<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="includes/bootstrap.jsp"%>
</head>

<body>
<!-- container section start -->
<section id="container" class="">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/sidebar.jsp"%>--%>

    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row">
            <h3> Registered Employees: </h3>
            <table class="table table-striped" border="1">
                <tr>
                    <th>Id:</th>
                    <th>Name:</th>
                    <th>Phone </th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <tr>
                    <%
                        //   User user = new User();
                        //String role = user.getRole().getAccessLevel();
                        try {
                            List<Employee> employees = (List<Employee>) session.getAttribute("employees");
                            if (employees != null) {

                                for (Employee employee : employees) {

                    %>
                    <td><%= employee.getId() %>
                    </td>
                    <td><%= employee.getName()%>
                    </td>
                    <td><%= employee.getPhoneNumber()%>
                    </td>
                    <td><%= employee.getId() %>
                    </td>
                    <td><%= employee.getId()%>
                    </td>
                    <td>
                        <a>
                            <form action="employeeServlet" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" value="<%= employee.getId() %>">
                                    <button type="submit" class="btn btn-secondary" name="button" id="updateButton"
                                            value="updateButton">Update
                                    </button>
                                </div>
                            </form>
                        </a>
                    </td>

                    <td>
                        <a>
                            <form action="employeeServlet" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" value="<%= employee.getId() %>">
                                    <button type="submit" onclick="window.alert('Do you want to delete?')"
                                            class="btn btn-danger" name="button" id="deleteButton"
                                            value="deleteButton">
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
