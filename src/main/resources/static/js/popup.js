// JavaScript Document
/*-------------------------- +
  拖拽函数
 +-------------------------- */
function drag(oDrag, handle) {
    var disX = dixY = 0;
    var oClose = document.getElementById('close');
    handle = handle || oDrag;
    handle.style.cursor = "move";
    handle.onmousedown = function (event) {
        var event = event || window.event;
        disX = event.clientX - oDrag.offsetLeft;
        disY = event.clientY - oDrag.offsetTop;

        document.onmousemove = function (event) {
            var event = event || window.event;
            var iL = event.clientX - disX;
            var iT = event.clientY - disY;
            var maxL = document.documentElement.clientWidth - oDrag.offsetWidth;
            var maxT = document.documentElement.clientHeight - oDrag.offsetHeight;

            iL <= 0 && (iL = 0);
            iT <= 0 && (iT = 0);
            iL >= maxL && (iL = maxL);
            iT >= maxT && (iT = maxT);

            oDrag.style.left = iL + "px";
            oDrag.style.top = iT + "px";

            return false
        };

        document.onmouseup = function () {
            document.onmousemove = null;
            document.onmouseup = null;
            this.releaseCapture && this.releaseCapture()
        };
        this.setCapture && this.setCapture();
        return false
    };
}

/*-------------------------- +
  弹出层显示函数
 +-------------------------- */
function show(id) {
    var objDiv = document.getElementById(id);
    var fade = document.getElementById('fade');
    document.documentElement.style.overflow = "hidden";
    objDiv.style.visibility = "visible";
    fade.style.display = 'block';
}

/*-------------------------- +
  弹出层隐藏
 +-------------------------- */
function hide(id) {
    var objDiv = document.getElementById(id);
    var fade = document.getElementById('fade');
    document.documentElement.style.overflow = "";
    objDiv.style.visibility = "hidden";
    fade.style.display = 'none';
}

/*window.onload = function ()
{   
	//发送信息弹出层
	var oDrag = document.getElementById("drag");
	var oTitle = document.getElementById("title");

	drag(oDrag, oTitle);
	oDrag.style.left = (document.documentElement.clientWidth - oDrag.offsetWidth) / 2 + "px";
	oDrag.style.top = (document.documentElement.clientHeight - oDrag.offsetHeight) / 2 + "px";
	
}*/