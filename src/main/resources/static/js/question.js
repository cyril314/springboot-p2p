// JavaScript Document
$(document).ready(function () {//问题选项卡的js
    var label = $('.que');
    var content = $('.ans');
    $('.ans').not().hide();
    $('.que').on("click", function () {
        var labelClicked = $(this);
        var labelContent = labelClicked.next();
        if (labelContent.is(":visible")) {
            return;
        }
        content.slideUp("normal");
        labelContent.slideDown("slow");
    });
});