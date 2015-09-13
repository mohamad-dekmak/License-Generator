<%-- 
    Document   : client-form
    Created on : Sep 13, 2015, 06:432:55 PM
    Author     : mdekmak
--%>

<form accept-charset="utf-8" method="post" id="clientForm" class="form-horizontal" novalidate="" action="">
    <div class="clearfix">&nbsp;</div>
    <div id="personal_info_div" class="col-md-12 no-padding">
        <div class="col-md-12 no-padding">
            <div class="form-group col-md-6">
                <label class="control-label no-padding-right col-lg-3 col-sm-2 col-xs-12 required">Name</label>
                <div class="col-lg-8 col-sm-7 col-xs-12">
                    <input type="text" class="form-control" value="" required="required" maxlength="255" id="name" name="name">
                </div>
            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div class="form-group col-md-6">
                <label class="control-label no-padding-right col-lg-3 col-sm-2 col-xs-12">Phone</label>
                <div class="col-lg-8 col-sm-7 col-xs-12">
                    <input type="text" class="form-control" value="" maxlength="255" id="phone" name="phone">
                </div>
            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div class="form-group col-md-6">
                <label class="control-label no-padding-right col-lg-3 col-sm-2 col-xs-12">Address</label>
                <div class="col-lg-8 col-sm-7 col-xs-12">
                    <input type="text" class="form-control" value="" maxlength="255" id="address" name="address">
                </div>
            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div class="form-group col-md-6">
                <label class="control-label no-padding-right col-lg-3 col-sm-2 col-xs-12">Country</label>
                <%@include file="countries-dropdown.jsp" %>
            </div>
        </div>
    </div>
    <div class="clearfix">&nbsp;</div>
    <div class="col-md-12">
        <div class="col-md-1"></div>
        <div class="col-md-2">
            <input class="btn btn-info" onclick="clientBtn();" value="Save" type="button" />
        </div>
        <div class="col-md-1">
            <a href="clients-list.jsp" class="pull-right btn btn-link">Back to list</a>
        </div>
    </div>
    <div class="clearfix">&nbsp;</div>
    <div class="col-md-12">
        <div class="col-md-1"></div>
        <div class="col-md-6">
            <div id="helpMsgContainer">
                <p class="help-block text-green hide" id="successMsg">Client added successfully</p>
                <p class="help-block text-red" id="errorMsg"></p>
            </div>
        </div>
    </div>
</form>