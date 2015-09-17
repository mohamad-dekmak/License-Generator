<%-- 
    Document   : licenses
    Created on : Sep 17, 2015, 8:42:00 PM
    Author     : mdekmak
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="m.dekmak.Database"%>
<%@include file="header.jsp" %>

<div class="page-container">
    <div class="panel panel-default">
        <div class="panel-heading">
            Licenses List
            <div class="btn-group pull-right">
                <button class="btn btn-info">Actions</button>
                <button class="btn btn-info dropdown-toggle dropdown-actions-list" data-toggle="dropdown"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="license-add.jsp">Add License</a></li>
                    <li class="divider"></li>
                    <li><a href="export-excel/licenses.jsp?exportToExcel=YES">Export to Excel</a></li>
                </ul>
            </div>
        </div>
        <table class="table">
            <thead>
            <th style="width: 400px;">Product Name</th>
            <th style="width: 400px;">Client Name</th>
            <th style="width: 400px;">Nb of Users</th>
            <th style="width: 400px;">Generated on</th>
            <th style="width: 400px;">Expires on</th>
            <th style="width: 400px;">Actions</th>
            </thead>
            <tbody>
                <% // load licenses list                    
                    List<String> licenses = new ArrayList<String>();
                    Database db = new Database();
                    licenses = db.getLicensesList();
                    for (int i = 0; i < licenses.size(); i++) {
                        String cell = (String) licenses.get(i);
                        String[] params = cell.split(",");
                %>
                <tr>
                    <%
                        for (int j = 0; j < params.length; j++) {
                            String id = params[0].substring(1);
                            String client = params[2].substring(1);
                            String text = params[j];
                            if (text.startsWith("[")) {
                                text = text.substring(1);
                            }
                            if (text.endsWith("]")) {
                                text = text.substring(0, text.length() - 1);
                            }
                            if (j == 6) { // "*action*"
                    %>
                    <td style="width: 400px;">
                        <a href="license-template.jsp?download=YES&id=<%= id%>&client=<%= client%>">
                            <button type="button" class="btn btn-default" title="Download">
                                <span class="glyphicon glyphicon-download" aria-hidden="true"></span>
                            </button>
                        </a>
                    </td>
                    <%
                    } else if (j != 0) {
                    %>
                    <td style="width: 400px;"><%= text%></td>
                    <%
                            }
                        }
                    %>
                </tr>
                <%
                    }%>

            </tbody>
        </table>
    </div>
</div>

<%@include file="footer.jsp" %>