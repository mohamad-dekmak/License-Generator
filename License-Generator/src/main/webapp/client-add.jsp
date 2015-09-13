<%-- 
    Document   : client-add
    Created on : Sep 13, 2015, 06:37:00 PM
    Author     : mdekmak
--%>

<%@include file="header.jsp" %>

<div class="container master-container">
    <div class="row">
        <div class="panel panel-success">
            <div class="panel-heading">Add Client</div>
            <div class="panel-body">
                <%@include file="client-form.jsp" %>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#clientForm").submit(function () {
            clientBtn();
        });
    });
    function clientBtn() {
        var name = $("#name", "#clientForm").val();
        var msg = "";
        if (!name) {
            msg = "Name is required";
            document.getElementById("errorMsg").innerHTML = msg;
        } else {
            // submit client form
            $("#errorMsg").addClass("hide");
            var formData = JSON.stringify($("#clientForm").serializeObject());
            $.ajax({
                url: "user-actions.jsp",
                dataType: 'JSON',
                type: 'POST',
                data: {userAction: "addClient", data: formData},
                success: function (response) {
                    if (response.data == "success") {
                        $("#errorMsg").addClass("hide");
                        $("#successMsg").removeClass("hide");
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