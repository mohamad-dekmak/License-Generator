<%-- 
    Document   : clients-list
    Created on : Sep 13, 2015, 06:47:09 PM
    Author     : mdekmak
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="m.dekmak.Database"%>
<%@include file="header.jsp" %>

<div class="page-container">
    <div class="panel panel-default">
        <div class="panel-heading">
            Clients List
            <div class="btn-group pull-right">
                <button class="btn btn-info">Actions</button>
                <button class="btn btn-info dropdown-toggle dropdown-actions-list" data-toggle="dropdown"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="client-add.jsp">Add client</a></li>
                    <li class="divider"></li>
                    <li><a href="export-excel/clients.jsp?exportToExcel=YES">Export to Excel</a></li>
                </ul>
            </div>
        </div>
        <table class="table">
            <thead>
            <th style="width: 400px;">Name</th>
            <th style="width: 400px;">Phone</th>
            <th style="width: 400px;">Address</th>
            <th style="width: 400px;">Country</th>
            <th style="width: 400px;">Actions</th>
            </thead>
            <tbody>
                <% // load clients list                    
                    List<String> clients = new ArrayList<String>();
                    Database db = new Database();
                    clients = db.getClientsList();
                    for (int i = 0; i < clients.size(); i++) {
                        String cell = (String) clients.get(i);
                        String[] params = cell.split(",");
                %>
                <tr>
                    <%
                        for (int j = 0; j < params.length; j++) {
                            String id = params[0].substring(1);
                            String text = params[j];
                            if (text.startsWith("[")) {
                                text = text.substring(1);
                            }
                            if (text.endsWith("]")) {
                                text = text.substring(0, text.length() - 1);
                            }
                            if (j == 5) { // "*action*"
%>
                    <td style="width: 400px;">
                        <a href="client-edit.jsp?id=<%= id%>"><button type="button" class="btn btn-default" data-toggle="modal" data-whatever="@mdo" title="Edit Client">
                                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
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