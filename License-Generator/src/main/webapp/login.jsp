<%-- 
    Document   : login
    Created on : Sep 13, 2015, 03:42:27 AM
    Author     : mdekmak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>License Generator</title>
        <link type="text/css" rel="stylesheet" href="resources/bootstrap/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="resources/bootstrap/bootstrap-theme.min.css">
        <link type="text/css" rel="stylesheet" href="resources/css/main.css">
        <script src="resources/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/js/general.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container master-container">
            <div class="container">
                <div class="col-md-2"></div>
                <div class="col-md-8 alert alert-success fade in text-center" data-alert="alert">
                    <h4>
                        <strong>
                            Login to access the License Generator Web Application
                        </strong>
                    </h4>
                    <p>Here you'll see the usage of Simple Form</p>
                </div><div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">Login Form</div>
                        <div class="panel-body">
                            <form accept-charset="UTF-8" method="POST" action="j_security_check" novalidate="novalidate" id="loginForm">
                                <div class="form-group email required user_basic_email">
                                    <label class="email required control-label" for="user_basic_email">
                                        <abbr title="required">*</abbr> Username
                                    </label>
                                    <input class="string email required form-control" name="j_username" id="username" placeholder="Enter username" type="text">
                                </div>
                                <div class="form-group password required user_basic_password">
                                    <label class="password required control-label" for="user_basic_password">
                                        <abbr title="required">*</abbr> Password
                                    </label>
                                    <input class="password required form-control" name="j_password" id="password" placeholder="Password" type="password">
                                </div>
                                <input class="btn btn-default" name="commit" type="submit" value="Login">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </body>
</html>

