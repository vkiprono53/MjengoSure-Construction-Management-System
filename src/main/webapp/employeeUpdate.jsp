<%@ page import="com.kiprono.hr.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kiprono.hr.enums.AccessLevel" %>
<%@ page import="com.kiprono.hr.model.Employee" %>
<%--
<!DOCTYPE html>
<html lang="en">

<%@include file="includes/bootstrap.jsp"%>

<body>
<!-- container section start -->
<section id="container" class="">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/sidebar.jsp"%>
--%>


    <!--sidebar end-->
    <!--main content start-->
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


            <!-- Employee Update -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Update Employee
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="form-horizontal" role="form" action="employeeServlet" method="post">
                                    <%
                                        try {
                                            Employee employee = (Employee) session.getAttribute("employeeEdit");

                                    %>
                                    <div class="form-group ">
                                        <label for="id" class="control-label col-lg-2">EmployeeId: </label>
                                        <div class="col-lg-10">
                                            <input type="hidden" class="form-control" value="<%= employee.getId() %>" name="id" id="id"  required><%=employee.getId()%>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="name" class="control-label col-lg-2">Name <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" id="name"
                                                   name="name" minlength="5" type="text" value="<%=employee.getName()%>" required/>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="phoneNumber" class="control-label col-lg-2">PhoneNumber: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" name="phoneNumber" id="phoneNumber" type="text"
                                                   value="<%=employee.getPhoneNumber()%>" required/>
                                        </div>
                                    </div>


                                    <div class="form-group ">
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
                                    </div>



                                    <div class="form-group ">
                                        <label for="employeeRole" class="control-label col-lg-2">Employeerole: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <select id="employeeRole" name="employeeRole">

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
                                                   value="<%=employee.getClient().getClientCode()%>" required>
                                        </div>
                                    </div>



                                    <div class="form-group ">
                                        <label for="password" class="control-label col-lg-2">Password: <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" name="password" id="password"
                                                   value="<%= employee.getClient().getAddress()%>" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <button class="btn btn-primary" type="submit" name="button" id="updatingButton" value="updatingButton">Update
                                            </button>
                                            <button class="btn btn-default" type="button">Cancel</button>
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

            <br><br>
        </section>
    </section>
<%--
<%@include file="includes/footer.jsp"%>
    </section>
    <!--main content end-->
</section>
<!-- container section start -->

<!-- javascripts -->
<%@include file="includes/javascript.jsp"%>
</body>

</html>
--%>
