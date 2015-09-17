<%-- 
    Document   : license-add
    Created on : Sep 13, 2015, 07:35:00 PM
    Author     : mdekmak
--%>

<%@include file="header.jsp" %>

<div class="container master-container">
    <div class="row">
        <div class="panel panel-success">
            <div class="panel-heading">Add License</div>
            <div class="panel-body">
                <form accept-charset="utf-8" method="post" id="licenseForm" class="form-horizontal" novalidate="" action="">
                    <div class="clearfix">&nbsp;</div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-12 no-padding">
                            <div class="form-group col-md-6">
                                <label class="control-label no-padding-right col-lg-3 col-sm-2 col-xs-12 required">Product</label>
                                <%@include file="products-dropdown.jsp" %>
                            </div>
                        </div>
                        <div class="col-md-12 no-padding">
                            <div class="form-group col-md-6">
                                <label class="control-label no-padding-right col-lg-3 col-sm-2 col-xs-12 required">Client</label>
                                <%@include file="clients-dropdown.jsp" %>
                            </div>
                        </div>
                        <div class="col-md-12 no-padding">
                            <div class="form-group col-md-6">
                                <label class="control-label no-padding-right col-lg-3 col-sm-2 col-xs-12">Nb of Users</label>
                                <div class="col-lg-4 col-sm-7 col-xs-12">
                                    <input type="text" class="form-control" value="" maxlength="255" id="nbOfUsers" name="nbOfUsers">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 no-padding">
                            <div class="form-group col-md-6">
                                <label class="control-label no-padding-right col-lg-3 col-sm-2 col-xs-12">Expires On</label>
                                <div class="col-lg-4 col-sm-7 col-xs-12">
                                    <input type="text" class="form-control" value="" maxlength="255" id="expiresOn" name="expiresOn" placeholder="YYYY-MM-DD">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">&nbsp;</div>
                    <div class="col-md-12">
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <input class="btn btn-info" onclick="licenseBtn();" value="Save" type="button" />
                        </div>
                        <div class="col-md-1">
                            <a href="licenses.jsp" class="pull-right btn btn-link">Back to list</a>
                        </div>
                    </div>
                    <div class="clearfix">&nbsp;</div>
                    <div class="col-md-12">
                        <div class="col-md-1"></div>
                        <div class="col-md-6">
                            <div id="helpMsgContainer">
                                <p class="help-block text-green hide" id="successMsg">License saved successfully</p>
                                <p class="help-block text-red" id="errorMsg"></p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#expiresOn", "#licenseForm").datepicker({
            minDate: new Date()
        });
        $("#expiresOn", "#licenseForm").datepicker("option", "dateFormat", "yy-mm-dd");
        $("#licenseForm").submit(function () {
            licenseBtn();
        });
    });
    function licenseBtn() {
        var product = $("#product", "#licenseForm").val();
        var client = $("#client", "#licenseForm").val();
        var nbOfUsers = $("#nbOfUsers", "#licenseForm").val();
        var expiresOn = $("#expiresOn", "#licenseForm").val();
        var msg = "";
        if (!product) {
            msg = "product is required";
            document.getElementById("errorMsg").innerHTML = msg;
        } else if (!client) {
            msg = "client is required";
            document.getElementById("errorMsg").innerHTML = msg;
        } else if (!nbOfUsers) {
            msg = "nb of users is required";
            document.getElementById("errorMsg").innerHTML = msg;
        } else if (!expiresOn) {
            msg = "expires on is required";
            document.getElementById("errorMsg").innerHTML = msg;
        } else {
            // submit license form
            $("#errorMsg").addClass("hide");
            var formData = JSON.stringify($("#licenseForm").serializeObject());
            $.ajax({
                url: "user-actions.jsp",
                dataType: 'JSON',
                type: 'POST',
                data: {userAction: "addLicense", data: formData},
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