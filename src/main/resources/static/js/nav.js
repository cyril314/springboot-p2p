// JavaScript Document
window.onload = function () {
    var osy = document.getElementById('sy_hover');
    var olicai = document.getElementById('licai_hover');
    var ojk = document.getElementById('jk_hover');
    var ozq = document.getElementById('zq_hover');
    var ozh = document.getElementById('zh_hover');
    var obenj = document.getElementById('bj_hover');
    var okf = document.getElementById('kf_hover');
    var olt = document.getElementById('lt_hover');
    var osymenu = document.getElementById('sy_menu');
    var olcmenu = document.getElementById('licai_menu');
    var ojkmenu = document.getElementById('jk_menu');

    osy.onmouseover = function () {
        osymenu.style.display = 'block';
    }

    olicai.onmouseover = function () {
        olicai.className = 'navact';
        osymenu.style.display = 'none';
        olcmenu.style.display = 'block';
    }
    olicai.onmouseout = function () {
        olicai.className = '';
        osymenu.style.display = 'block';
        olcmenu.style.display = 'none';
    }

    ojk.onmouseover = function () {
        ojk.className = 'navact';
        osymenu.style.display = 'none';
        ojkmenu.style.display = 'block';
    }
    ojk.onmouseout = function () {
        ojk.className = '';
        osymenu.style.display = 'block';
        ojkmenu.style.display = 'none';
    }

    ozq.onmouseover = function () {
        ozq.className = 'navact';

    }
    ozq.onmouseout = function () {
        ozq.className = '';
    }

    ozh.onmouseover = function () {
        ozh.className = 'navact';

    }
    ozh.onmouseout = function () {
        ozh.className = '';
    }

    obenj.onmouseover = function () {
        obenj.className = 'navact';

    }
    obenj.onmouseout = function () {
        obenj.className = '';
    }

    okf.onmouseover = function () {
        okf.className = 'navact';

    }
    okf.onmouseout = function () {
        okf.className = '';
    }

    olt.onmouseover = function () {
        olt.className = 'navact';

    }
    olt.onmouseout = function () {
        olt.className = '';
    }
}
