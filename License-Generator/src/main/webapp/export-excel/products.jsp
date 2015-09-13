<%-- 
    Document   : products
    Created on : Sep 13, 2015, 03:43:28 PM
    Author     : mdekmak
--%>

<%@page import="m.dekmak.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    String exportToExcel = request.getParameter("exportToExcel");
    if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "inline; filename=products.xls");
    }
%>
<html>
    <table class="table">
        <thead>
        <th>Name</th>
    </thead>
    <tbody>
        <%
            List<String> products = new ArrayList<String>();
            Database db = new Database();
            products = db.getProductsList();
            for (int i = 0; i < products.size(); i++) {
                String cell = (String) products.get(i);
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
                    if (j != 2 && j != 0) {
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