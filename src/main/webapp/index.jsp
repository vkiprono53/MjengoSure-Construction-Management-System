<%@ page import="com.kiprono.hr.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kiprono.hr.model.Client" %>
<!DOCTYPE html>
<html lang="en">

<%@include file="includes/bootstrap.jsp"%>
    <!-- Custom styles -->

<div>
    <h2 style="color: white">
        <marquee><b><i>Welcome To MjengoSure Construction Management System</i></b></marquee>
    </h2>
</div>
<body class="login-img3-body">
  <div class="container">
    <form class="login-form" action="login" method="post">
      <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i></p>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          <input type="text" name="username" class="form-control" placeholder="Username" autofocus>
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
          <input type="password" name="password" class="form-control" placeholder="Password">
        </div>
          <div>
        <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                <span class="pull-right"> <a href="#"> Forgot Password?</a></span>
            </label>
          <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
      </div>
      </div>
    </form>
      <div>
          <form action="signup.jsp">
              <button class="btn btn-primary btn-md btn-block" type="submit">SignUp</button>
          </form>
      </div>
  </div>
<%@include file="includes/javascript.jsp"%>
</body>
</html>
