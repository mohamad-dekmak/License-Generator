<%-- 
    Document   : products
    Created on : Sep 13, 2015, 4:31:00 PM
    Author     : mdekmak
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="m.dekmak.Database"%>
<%@include file="header.jsp" %>

<div class="page-container">
    <div class="panel panel-default">
        <div class="panel-heading">
            Products List
            <div class="btn-group pull-right">
                <button class="btn btn-info">Actions</button>
                <button class="btn btn-info dropdown-toggle dropdown-actions-list" data-toggle="dropdown"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="product-add.jsp">Add Product</a></li>
                    <li class="divider"></li>
                    <li><a href="export-excel/products.jsp?exportToExcel=YES">Export to Excel</a></li>
                </ul>
            </div>
        </div>
        <table class="table">
            <thead>
            <th style="width: 400px;">Product Name</th>
            <th style="width: 400px;">Actions</th>
            </thead>
            <tbody>
                <% // load products list                    
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
                            String name = params[1].substring(1);
                            String text = params[j];
                            if (text.startsWith("[")) {
                                text = text.substring(1);
                            }
                            if (text.endsWith("]")) {
                                text = text.substring(0, text.length() - 1);
                            }
                            if (j == 2) { // "*action*"
%>
                    <td style="width: 400px;">
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editProductModal" data-whatever="@mdo" title="Edit Product" onclick="editProductDialog('<%= name%>');">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                        </button>
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

<div id="editProductModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editProductModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="editProductModal">Edit user group</h4>
            </div>
            <div class="modal-body">
                <form>
                    <input type="hidden" id="oldName" value="" />
                    <div class="form-group">
                        <label class="control-label">Name:</label>
                        <input type="text" class="form-control" id="name">
                    </div>
                    <p class="help-block text-red" id="validationEditMsg"></p>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default modalEditProductCloseBtn" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="editProductBtn">Save</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $("#editProductBtn").click(function () {
            var username = $("#name", "#editProductModal").val();
            var msg = "";
            if (!username) {
                msg = "Username is required.";
            } else {
                submitEditProductForm(username);
            }
            document.getElementById("validationEditMsg").innerHTML = msg;
        });
    });
</script>

<%@include file="footer.jsp" %>