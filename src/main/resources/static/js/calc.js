///////////////////////////////////////////////////////////////////select的自定义样式
window.onload = function ()
{
	var oSelect = document.getElementById('search').getElementsByTagName("span")[0];
	var oSub = document.getElementById('search').getElementsByTagName("ul")[0];
	var aLi = oSub.getElementsByTagName("li");
	oSelect.onclick = function (event){
		var style = oSub.style;
		style.display = style.display == "block" ? "none" : "block";
		//阻止事件冒泡
		(event || window.event).cancelBubble = true
	};
	for ( var i = 0; i < aLi.length; i++){
		//鼠标划过
		aLi[i].onmouseover = function (){
			this.className = "hover"
		};
		//鼠标离开
		aLi[i].onmouseout = function (){
			this.className = "";
		};
		//鼠标点击
		aLi[i].onclick = function (){
			oSelect.innerHTML = this.innerHTML	
		}
	}
	document.onclick = function (){
		oSub.style.display = "none";	
	};
};