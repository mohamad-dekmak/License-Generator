<%-- 
    Document   : licenses
    Created on : Sep 17, 2015, 08:55:28 PM
    Author     : mdekmak
--%>

<%@page import="m.dekmak.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    String exportToExcel = request.getParameter("exportToExcel");
    if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "inline; filename=licenses.xls");
    }
%>
<html>
    <table class="table">
        <thead>
        <th>Product Name</th>
        <th>Client Name</th>
        <th>Nb of Users</th>
        <th>Generated on</th>
        <th>Expires on</th>
    </thead>
    <tbody>
        <%
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
                    String text = params[j];
                    if (text.startsWith("[")) {
                        text = text.substring(1);
                    }
                    if (text.endsWith("]")) {
                        text = text.substring(0, text.length() - 1);
                    }
                    if (j != 6 && j != 0) {
            %>
            <td><%= text%></td>
            <%
                    }
                }
            %>
        </tr>
        <%
            }%>
    </tbody>
</table>
</html>