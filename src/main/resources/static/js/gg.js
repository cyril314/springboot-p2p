lastScrollY = 0;

function heartBeat() {
    var diffY;
    if (document.documentElement && document.documentElement.scrollTop)
        diffY = document.documentElement.scrollTop;
    else if (document.body)
        diffY = document.body.scrollTop
    else {/*Netscape stuff*/}
    percent = .1 * (diffY - lastScrollY);
    if (percent > 0) percent = Math.ceil(percent);
    else percent = Math.floor(percent);
    document.getElementById("lovexin12").style.top = parseInt(document.getElementById
    ("lovexin12").style.top) + percent + "px";
    document.getElementById("lovexin14").style.top = parseInt(document.getElementById
    ("lovexin12").style.top) + percent + "px";
    lastScrollY = lastScrollY + percent;
}

suspendcode12 = "<div id=\"lovexin12\" style='left:5px;POSITION:absolute;TOP:200px;'>&nbsp;</div>"
suspendcode14 = "<div id=\"lovexin14\" style='right:5px;POSITION:absolute;TOP:200px;'></div>"
document.write(suspendcode12);
document.write(suspendcode14);
window.setInterval("heartBeat()", 1);
