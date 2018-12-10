<%@ page import="com.kiprono.hr.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kiprono.hr.enums.AccessLevel" %>
<%@ page import="com.kiprono.hr.model.Employee" %>
<%@ page import="com.kiprono.hr.model.User" %>
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
                        <li><i class="fa fa-laptop"></i>employee</li>
                    </ol>
                </div>
            </div>

            <!-- Employee -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Add Employee
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="form-horizontal" role="form" action="employeeServlet" method="post">
                                    <div class="form-group ">
                                        <label for="name" class="control-label col-lg-2">Name <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" id="name" placeholder="Enter the name"
                                                   name="name" minlength="5" type="text" required/>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="phoneNumber" class="control-label col-lg-2">PhoneNumber: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" name="phoneNumber" id="phoneNumber" type="text"
                                                   placeholder="Enter the phone number" required/>
                                        </div>
                                    </div>

                 <%--                   <div class="form-group ">
                                        <label for="accessLevel" class="control-label col-lg-2">AccessLevel:</label>
                                        <div class="col-lg-10">
                                            <select id="accessLevel" name="accessLevel">
                                                <%
                                                    for (AccessLevel accessLevel : AccessLevel.values()) {
                                                %>
                                                <option value="<%= accessLevel%>"><%= accessLevel%>
                                                </option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>--%>


                                    <div class="form-group ">
                                        <label for="role" class="control-label col-lg-2">Employeerole: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <select id="role" name="role">

                                                <%
                                                    List<Role> roles = (List<Role>) session.getAttribute("roles");
                                                    if (roles != null) {
                                                        for (Role roleList : roles) { %>
                                                <option value="<%= roleList.getId()%>"><%= roleList.getRole() %>
                                                </option>

                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="username" class="control-label col-lg-2">Username: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="username" id="username"
                                                   placeholder="Enter the username" required>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="password" class="control-label col-lg-2">Password: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="password" id="password"
                                                   placeholder="Enter the password" required>
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
                                    <button type="submit" class="btn btn-info" name="button" id="updateButton"
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
<%--<%@include file="includes/footer.jsp"%>
    </section>
    <!--main content end-->
</section>
<!-- container section start -->

<!-- javascripts -->
<%@include file="includes/javascript.jsp"%>

</body>

</html>--%>
