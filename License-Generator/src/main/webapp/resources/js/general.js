function editProductDialog(name) {
    $("#name", '#editProductModal').val(name);
    $("#oldName", '#editProductModal').val(name);
    $('#editProductModal').on('show.bs.modal', function (event) {
        var modal = $(this);
        modal.find('.modal-title').text("Edit product \"" + name + "\"");
    });
}
function submitEditProductForm(name) {
    var oldName = $("#oldName", '#editProductModal').val();
    if (oldName == name) {
        alert("no changes!!!");
        $(".modalEditProductCloseBtn").click();
    } else {
        $.ajax({
            url: "user-actions.jsp",
            dataType: 'JSON',
            type: 'POST',
            data: {userAction: "editProduct", oldName: oldName, newName: name},
            success: function (response) {
                alert(response.data);
                $(".modalEditProductCloseBtn").click();
                location.reload();
            },
            error: function (xhr, status) {
                alert("Sorry, there was a problem!");
            }
        });
    }
}
function getCurrentURLWithoutGetParams()
{
    //get full url
    var url = window.location.href;
    //get url after/  
    var value = url.substring(0, url.indexOf('?'));
    //get the part after before ?
    //value = value.split("?")[0];
    return value;
}
$.fn.serializeObject = function ()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};