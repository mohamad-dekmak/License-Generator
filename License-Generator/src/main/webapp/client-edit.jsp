<%-- 
    Document   : client-add
    Created on : Sep 13, 2015, 06:39:00 PM
    Author     : mdekmak
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="m.dekmak.Database"%>
<%@include file="header.jsp" %>

<% // load form data    
    String id = request.getParameter("id");
    Database db = new Database();
    List<String> data = new ArrayList<String>();
    data = db.loadClient(id);
    String name = "", phone = "", address = "", country = "";
    if (data.size() > 0) {
        for (int i = 0; i < data.size(); i++) {
            String cell = (String) data.get(i);
            String[] params = cell.split(",");
            for (int j = 0; j < params.length; j++) {
                if (params[j].startsWith("[")) {
                    params[j] = params[j].substring(0);
                }
                if (params[j].endsWith("]")) {
                    params[j] = params[j].substring(0, params[j].length() - 1);
                }
                params[j] = params[j].replaceAll("&comma&", ",").substring(1);
                if (j == 0) {
                    name = params[j];
                } else if (j == 1) {
                    phone = params[j];
                } else if (j == 2) {
                    address = params[j];
                } else if (j == 3) {
                    country = params[j];
                }
            }
        }
    } else {
        // @to-Do: redirect to clients list
    }
%>

<div class="container master-container">
    <div class="row">
        <div class="panel panel-success">
            <div class="panel-heading">Edit Client</div>
            <div class="panel-body">
                <%@include file="client-form.jsp" %>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    id = null;
    $(function () {
        id = '<%= id%>';
        if (!id || id == "null" || id <= 0) {
            var currentURL = getCurrentURLWithoutGetParams();
            var indexOfProjectName = nth_occurrence(currentURL, '/', 4);
            window.location = currentURL.substring(0, indexOfProjectName + 1) + "clients.jsp";
        } else {
            $('#name').val('<%= name%>');
            $('#phone').val('<%= phone%>');
            $('#address').val('<%= address%>');
            $('#country').val('<%= country%>');
        }
        $("#clientForm").submit(function () {
            clientBtn();
        });
    });
    function clientBtn() {
        var name = $("#name", "#clientForm").val();
        var msg = "";
        if (!name) {
            msg = "First name is required";
            document.getElementById("errorMsg").innerHTML = msg;
        } else {
            // submit client form
            $("#errorMsg").addClass("hide");
            var formData = JSON.stringify($("#clientForm").serializeObject());
            $.ajax({
                url: "user-actions.jsp",
                dataType: 'JSON',
                type: 'POST',
                data: {userAction: "editClient", data: formData, id: id},
                success: function (response) {
                    if (response.data == "success") {
                        $("#errorMsg").addClass("hide");
                        $("#successMsg").html('Client saved successfully').removeClass("hide");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1500);
                    } else {
                        $("#successMsg").addClass("hide");
                        $("#errorMsg").removeClass("hide").html(response.data);
                    }
                },
                error: function (xhr, status) {
                    alert("Sorry, there was a problem!");
                }
            });
        }
    }
</script>
<%@include file="footer.jsp" %>