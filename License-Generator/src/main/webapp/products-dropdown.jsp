<%-- 
    Document   : products-dropdown
    Created on : Aug 27, 2015, 11:34:58 PM
    Author     : mdekmak
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="m.dekmak.Database"%>
<%@page import="java.util.List"%>

<select class="selectpicker" id="product" name="product">
    <%
        List<String> products = new ArrayList<String>();
        Database dbClass = new Database();
        products = dbClass.getProductsList();
        for (int i = 0; i < products.size(); i++) {
            String cell = (String) products.get(i);
            String[] params = cell.split(",");
    %>

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
            if (j == 1) {
%>
    <option value="<%= id%>"><%= text%></option>
    <%
            }
        }
    %>
    <%
    }%>

</select>
