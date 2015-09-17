<%-- 
    Document   : index
    Created on : Sep 13, 2015, 03:50:52 PM
    Author     : mdekmak
--%>

<%@include file="header.jsp" %>

<div class="col-md-12">
    <div class="col-md-4">
        <div class="panel panel-success">
            <div class="panel-heading">Products</div>
            <div class="panel-body">
                <div class="col-md-4 no-padding">
                    <a href="products.jsp">
                        <img class="img-rounded" src="resources/images/products.png" width="115" height="115" />
                    </a>
                </div>
                <div class="col-md-8">
                    <div class="clearfix">&nbsp;</div>
                    <p class="text">Manage your products, add, edit and list current products.</p>
                    <a href="products.jsp" class="btn btn-link no-padding">Manage</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="panel panel-success">
            <div class="panel-heading">Clients</div>
            <div class="panel-body">
                <div class="col-md-4 no-padding">
                    <a href="clients-list.jsp">
                        <img class="img-rounded" src="resources/images/clients.png" width="115" height="115" />
                    </a>
                </div>
                <div class="col-md-8">
                    <div class="clearfix">&nbsp;</div>
                    <p class="text">Manage your clients and related information.</p>
                    <a href="client-add.jsp" class="btn btn-link no-padding">Add</a>&nbsp;&nbsp; - &nbsp;&nbsp;
                    <a href="clients-list.jsp" class="btn btn-link no-padding">Search</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="panel panel-success">
            <div class="panel-heading">Licenses</div>
            <div class="panel-body">
                <div class="col-md-4 no-padding">
                    <a href="license-add.jsp">
                        <img class="img-rounded" src="resources/images/licenses.png" width="115" height="115" />
                    </a>
                </div>
                <div class="col-md-8">
                    <div class="clearfix">&nbsp;</div>
                    <p class="text">Generate your licenses by managing your clients, adding users & more.</p>
                    <a href="license-add.jsp" class="btn btn-link no-padding">Generate</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>