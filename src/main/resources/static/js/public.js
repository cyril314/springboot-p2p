// JavaScript Document
////////////////////////////////////////////////////////////////首页最新活动的左右按钮的显示隐藏js
function showbtn() {
    document.getElementById('prev').style.display = 'block';
    document.getElementById('next').style.display = 'block';
}

function hidebtn() {
    document.getElementById('prev').style.display = 'none';
    document.getElementById('next').style.display = 'none';
}

////////////////////////////////////////////////////////////////底部二维码的显示隐藏js
function show(id) {//底部二维码的显示js    
    var objDiv = document.getElementById(id);
    objDiv.style.display = "block";
}

function hide(id) {//底部二维码的隐藏js
    var objDiv = document.getElementById(id);
    objDiv.style.display = "none";
}

/////////////////////////////////////////////////////////////////帮助中心的菜单切换的js
function switchmenu(menu) {
    for (var i = 1; i < 9; i++) {
        if (menu == "menu" + i) {
            document.getElementById("menu" + i).className = "on" + i;
        } else {
            document.getElementById("menu" + i).className = "menu" + i;
        }
    }
}

function acc_menu() {
}