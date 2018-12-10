<!DOCTYPE html>
<html lang="en">
<%@include file="includes/bootstrap.jsp"%>

<body class="login-img3-body">
<div class="container">
    <form class="login-form" role="form" style="width: 600px" action="ClientServlet" method="post">
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
                <div>
                    <header><b style="text-align: center">Enter Your Details</b></header>
                </div>
                <br>
                <hr>
               <div class="form-group ">
                    <label for="name" class="control-label col-md-4">Name:<span
                            class="required">*</span></label>
                    <div class="col-md-8">
                        <input type="text" class="form-control"  name="name" id="name"
                               required>
                    </div>
                </div>
                <br>
                <hr>

                <div class="form-group ">
                    <label for="physicalAddress" class="control-label col-md-4">Address:<span
                            class="required">*</span></label>
                    <div class="col-md-8">
                        <input type="text" class="form-control"  name="physicalAddress" id="physicalAddress"
                               required>
                    </div>
                </div>
                <br>
                <hr>

                <div class="form-group ">
                    <label for="email" class="control-label col-md-4">Email:<span
                            class="required">*</span></label>
                    <div class="col-lg-8">
                        <input type="email" class="form-control"  name="email" id="email"
                               required>
                    </div>
                </div>


                <div class="form-group ">
                    <label for="phoneNumber" class="control-label col-md-4">Role:<span
                            class="required">*</span></label>
                    <div class="col-md-8">
                        <select name="role" id="role">
                            <option value="1">Admin</option>
                        </select>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="phoneNumber" class="control-label col-md-4">Phone:<span
                            class="required">*</span></label>
                    <div class="col-md-8">
                        <input type="tel" class="form-control"  name="phoneNumber" id="phoneNumber"
                               required>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="username" class="control-label col-md-4">Username:<span
                            class="required">*</span></label>
                    <div class="col-md-8">
                        <input type="text" class="form-control"  name="username" id="username"
                               required>
                    </div>
                </div>


                <div class="form-group ">
                    <label for="password" class="control-label col-md-4">Password:<span
                            class="required">*</span></label>
                    <div class="col-md-8">
                        <input type="password" class="form-control"  name="password" id="password"
                               required>
                    </div>
                </div>
            <br>
            <hr>
<div>
            <button class="btn btn-primary btn-lg btn-block" type="submit" name="button" id="saveButton" value="saveButton">
                Save</button>
</div>
        </div>
    </form>
<%@include file="includes/footer.jsp"%>
</div>
</body>
</html>
