var product = {
    init: function () {
        product.registerEvents();
    },
    registerEvents: function () {
        $('#btnCommentNew').off('click').on('click', function (e) {
            e.preventDefault;
           var btn = $(this);
            var productid = btn.data('productid');
            var userid = btn.data('userid');
            var commentmsg = $('#txtCommentNew').val();
            //var rate = document.getElementById('ddlRate');
            if (commentmsg.value == "") {

                window.alert("Chưa nhập nội dung bình luận");
                return;
            }
            $.ajax({
                url: "/Product/AddNewComment",
                data: {
                    productid: productid,
                    userid: userid,
                    parentid: 0,
                    commentmsg: commentmsg,
                   // rate: rate
                },
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    if (response.status == true) {
                        commentmsg.value = "";
                        window.alert("Bạn đã thêm bình luận thành công!");
                        $("#div_allcomment").load("/Product/GetComment?productid=" + productid);
                    }
                    else {
                        bootbox.alert("Thêm bình luận lỗi");
                    }
                }
            });
        });

        


    }
}
product.init();