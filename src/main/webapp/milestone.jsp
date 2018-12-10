<%@ page import="com.kiprono.hr.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kiprono.hr.enums.AccessLevel" %>
<%@ page import="com.kiprono.hr.model.Employee" %>
<%@ page import="com.kiprono.projectManagement.model.Project" %>
<%@ page import="com.kiprono.projectManagement.model.Milestone" %>
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
                        <li><i class="fa fa-laptop"></i>milestone</li>
                    </ol>
                </div>
            </div>

            <!-- Project -->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Add Milestone
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="form-horizontal" id="form_members" role="form" action="milestoneServlet" method="post">
                                    <div class="form-group ">
                                        <label for="milestoneName" class="control-label col-lg-2">milestoneName:<span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" name="milestoneName" id="milestoneName" placeholder="Enter the milestoneName"
                                                   type="text" required/>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="milestoneDescription" class="control-label col-lg-2">milestoneDescription:<span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input class="form-control" name="milestoneDescription" id="milestoneDescription" placeholder="Enter the milestoneDescription"
                                                   minlength="10" type="text" required/>
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
            <h3>Existing Milestones: </h3>
            <table class="table table-striped" border="1">
                <tr>
                    <th>MilestoneName:</th>
                    <th>Description:</th>
                    <th>ExpectedStartDate:</th>
                    <th>expectedDuration:</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <tr>
                    <%
                        try {
                            List<Milestone> milestones = (List<Milestone>) session.getAttribute("milestones");
                            if (milestones != null) {
                                for (Milestone milestone : milestones) { %>
                    <td><%= milestone.getMilestoneName() %></td>
                    <td><%= milestone.getMilestoneDescription() %> </td>
                    <td><%= milestone.getExpectedStartDate()%></td>
                    <td><%= milestone.getExpectedDuration() %> </td>
                    <td>
                        <a>
                            <form action="milestoneServlet" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" value="<%= milestone.getId() %>">
                                    <button type="submit" class="btn btn-info" name="button" id="updateButton"
                                            value="updateButton">Update
                                    </button>
                                </div>
                            </form>
                        </a>
                    </td>
                    <td>
                        <a>
                            <form action="milestoneServlet" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" value="<%= milestone.getId() %>">
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
