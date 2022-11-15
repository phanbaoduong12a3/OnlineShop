var common = {
    init: function () {
        common.registerEvent();
    },
    registerEvent: function () {
        $("#txtKeyword").autocomplete({
            minLength: 0,
            source: function (request, response) {
                $.ajax({
                    url: "/Product/ListName",
                    dataType: "json",
                    data: {
                        q: request.term
                    },
                    success: function (res) {
                        response(res.data);
                    }
                });
            },
            focus: function (_event, ui) {
                $("#txtKeyword").val(ui.item.lable);
                return false;
            },
            
            select: function (_event, ui) {
                $("#txtKeyword").val(ui.item.lable);
                
                return false;
            }
        })
            .autoComplete("instance")._renderItem = function (ul, item) {
                return $("<li>")
                    .append("<a>" + item.lable + "</a>")
                    .appendTo(ul);
            };
    }
}
common.init();
