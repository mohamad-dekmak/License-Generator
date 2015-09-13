<%-- 
    Document   : header
    Created on : Sep 13, 2015, 03:42:14 PM
    Author     : mdekmak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>License Generator</title>
        <link type="text/css" rel="stylesheet" href="resources/bootstrap/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="resources/bootstrap/bootstrap-theme.min.css">
        <link type="text/css" rel="stylesheet" href="resources/bootstrap/bootstrap-select.min.css">
        <link type="text/css" rel="stylesheet" href="resources/css/main.css">
        <link type="text/css" rel="stylesheet" href="resources/jquery/jquery-ui.min.css" media="all" />

        <script src="resources/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="resources/js/general.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/jquery/jquery-ui.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/jquery-ui.min.js"></script>
    </head>
    <body>
        <script type="text/javascript">
            $(document).ready(function () {

            });
        </script>
        <%
            String userProfileName = request.getUserPrincipal().getName();
        %>
        <div class="container">
            <div class="col-md-2"></div>
            <div class="col-md-8 alert alert-success fade in text-center" data-alert="alert">
                <h4>
                    <strong>
                        Welcome "<%= userProfileName%>" to License Generator
                    </strong>
                </h4>
                <p>Here you'll see the features and full pages of License Generator</p>
            </div><div class="col-md-2"></div>

        </div>
        <nav id="navbar-example" class="navbar navbar-default navbar-static">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-example-js-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">License Generator</a>
                </div>
                <div class="collapse navbar-collapse bs-example-js-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a id="dropDashboard" href="products.jsp" role="button">
                                Products
                            </a>
                        </li>
                        <li class="dropdown">
                            <a id="dropDashboard" href="clients.jsp" role="button">
                                Clients
                            </a>
                        </li>
                        <li class="dropdown">
                            <a id="dropDashboard" href="licenses.jsp" role="button">
                                Licenses
                            </a>
                        </li>
                        <li class="dropdown">
                            <a id="dropReports" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">
                                Reports
                            </a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li id="fat-menu" class="dropdown">
                            <a id="drop3" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">
                                <%
                                    out.println(userProfileName);
                                %>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="drop3">
                                <li><a href="https://github.com/pascalfares/smb215-15" target="_blank">Help</a></li>
                                <li><a href="https://github.com/pascalfares/smb215-15/issues" target="_blank">Report a bug</a></li>
                                <li class="divider"></li>
                                <li><a href="https://localhost:8443/License-Generator/logout.jsp">Sign out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container-fluid -->
        </nav>