<%-- 
    Document   : product-add
    Created on : Aug 25, 2015, 7:27:00 PM
    Author     : mdekmak
--%>

<%@include file="header.jsp" %>

<div class="container master-container">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="panel panel-success">
                <div class="panel-heading">Add Product</div>
                <div class="panel-body">
                    <form accept-charset="UTF-8" method="POST" action="" novalidate="novalidate" id="addProductForm">
                        <div class="form-group required">
                            <label class="required control-label">
                                <abbr title="required">*</abbr> Name
                            </label>
                            <input class="string required form-control" name="name" id="name" placeholder="Enter your product name" type="text">
                        </div>
                        <input class="btn btn-default" type="button" value="Submit" name="btnSubmit" onclick="addProductBtn();">
                        <a href="products.jsp" class="pull-right btn btn-link">Back to list</a>
                        <div class="clearfix">&nbsp</div>
                        <div id="helpMsgContainer">
                            <p class="help-block text-green hide" id="successMsg">Product added successfully</p>
                            <p class="help-blolck text-red" id="errorMsg"></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#addProductForm").submit(function () {
            addProductBtn();
        });
    });
    function addProductBtn() {
        var name = $("#name", "#addProductForm").val();
        var msg = "";
        if (!name) {
            msg = "Name is required.";
            document.getElementById("errorMsg").innerHTML = msg;
        }else {
            // submit product group form
            $("#errorMsg").addClass("hide");
            $.ajax({
                url: "user-actions.jsp",
                dataType: 'JSON',
                type: 'POST',
                data: {userAction: "addProduct", name: name},
                success: function (response) {
                    if (response.data == "success") {
                        $("#errorMsg").addClass("hide");
                        $("#successMsg").removeClass("hide");
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