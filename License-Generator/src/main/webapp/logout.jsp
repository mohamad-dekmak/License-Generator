<%-- 
    Document   : logout
    Created on : Sep 13, 2015, 03:42:27 PM
    Author     : mdekmak
--%>

<%@include file="header.jsp" %>
<%
    session = request.getSession();
    session.invalidate();
%>
<div class="panel panel-warning">
    <div class="panel-heading">
        <h3 class="panel-title">Sign Out from License Generator</h3>
    </div>
    <div class="panel-body">
        You have successfully logged out.
        Click <a href="https://localhost:8443/License-Generator"><b>here</b></a> for another login.
    </div>
</div>
<%@include file="footer.jsp" %>
