<%@ page import="com.kiprono.hr.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kiprono.hr.enums.AccessLevel" %>
<%--<!-- container section start -->
<section id="container" class="">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/sidebar.jsp"%>--%>

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
                        <li><i class="fa fa-laptop"></i>role</li>
                    </ol>
                </div>
            </div>

                 <!-- project team & activity start -->
            <div class="row">

                    <form class="form-horizontal" id="addRole" name="addRole" role="form" action="roleServlet" method="post">
                        <legend>Role's Details:</legend>

                        <div class="form-group ">
                            <label for="role" class="control-label col-lg-2">role:<span
                                    class="required">*</span></label>
                            <div class="col-lg-10">
                                <input class="form-control" name="role" id="role" placeholder="Enter the role"
                                        type="text" required/>
                            </div>
                        </div>


                        <div class="form-group ">
                            <label for="accessLevel" class="control-label col-lg-2">AccessLevel:<span
                                    class="required">*</span></label>
                            <div class="col-lg-10">
                                <select id="accessLevel" name="accessLevel">
                                    <%
                                        for (AccessLevel accessLevel : AccessLevel.values()){
                                    %>
                                    <option value="<%=accessLevel%>"><%=accessLevel%></option>
                                    <%
                                        }
                                    %>
                                </select>

                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-sm-offset-6 col-sm-6">
                                <button type="submit" class="btn btn-info btn-md" name="button" id="saveButton"
                                        value="saveButton">Save
                                </button>
                            </div>
                        </div>
                    </form>
                    <br>
                    <hr>
                    <h3>Registered Roles: </h3>

                <table class="table table-striped" border="1">
                    <tr>
                        <th>RoleId:</th>
                        <th>Roles:</th>
                        <th>AccessLevel</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                    <tr>
                        <%
                            try {
                                List<Role> roles = (List<Role>) session.getAttribute("roles");
                                if (roles != null) {
                                    for (Role roleList : roles) { %>
                        <td><%= roleList.getId() %>
                        </td>
                        <td><%= roleList.getRole() %>
                        </td>
                        <td><%= roleList.getAccessLevel() %>
                        </td>


                        <td>
                            <a>
                                <form action="roleServlet" method="post">
                                    <div class="form-group">
                                        <input type="hidden" name="id" value="<%= roleList.getId() %>">
                                        <button type="submit" class="btn btn-info" name="button" id="updateButton"
                                                value="updateButton">Update
                                        </button>
                                    </div>
                                </form>
                            </a>
                        </td>

                        <td>
                            <a>
                                <form action="roleServlet" method="post">
                                    <div class="form-group">
                                        <input type="hidden" name="id" value="<%= roleList.getId() %>">
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


            </div>
            <br><br>
        </section>

    </section>

<%--<%@include file="includes/footer.jsp"%>
    </section>--%>
    <!--main content end-->
<%--</section>--%>
<!-- container section start -->

<%--<!-- javascripts -->
<%@include file="includes/javascript.jsp"%>--%>
