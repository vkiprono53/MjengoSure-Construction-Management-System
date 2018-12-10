<%@ page import="com.kiprono.hr.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kiprono.hr.enums.AccessLevel" %>
<!DOCTYPE html>
<html lang="en">

<%@include file="includes/bootstrap.jsp"%>
<body>
<!-- container section start -->
<section id="container" class="">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/sidebar.jsp"%>
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
                <h2>Update Role</h2>
                <form class="form-horizontal" id="form_members" role="form" action="roleServlet" method="post">
                    <%
                        try {
                            Role role = (Role) session.getAttribute("roleEdit");

                    %>

                    <div class="form-group ">
                        <label for="role" class="control-label col-lg-2">RoleId:<span
                                class="required">*</span></label>
                        <div class="col-lg-10">
                            <input type="hidden" class="form-control" value="<%= role.getId() %>" name="id" id="id"
                                   required>
                        </div>
                    </div>


                    <div class="form-group ">
                        <label for="role" class="control-label col-lg-2">Role:<span
                                class="required">*</span></label>
                        <div class="col-lg-10">
                            <input class="form-control" name="role" id="role" value="<%= role.getRole()%>"
                                   type="text" required/>
                        </div>
                    </div>

                    <div class="form-group ">
                        <label for="accessLevel" class="control-label col-lg-2">AccessLevel:<span
                                class="required">*</span></label>
                        <div class="col-lg-10">
                            <select id="accessLevel" name="accessLevel">
                                <%
                                    for (AccessLevel accessLevel : AccessLevel.values()) {
                                %>
                                <option value="<%=accessLevel%>"><%=accessLevel%>
                                </option>
                                <%
                                    }
                                %>
                            </select>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-6 col-sm-6">
                            <button type="submit" class="btn btn-info btn-md" name="button" id="updatingButton"
                                    value="updatingButton">Update
                            </button>
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
            <br><br>
        </section>
        <div class="text-right">
            <div class="credits">
                Designed by <a>Vincent</a>
            </div>
        </div>
    </section>
    <!--main content end-->
</section>
<!-- container section start -->

<!-- javascripts -->
<%@include file="includes/javascript.jsp"%>

</body>

</html>
