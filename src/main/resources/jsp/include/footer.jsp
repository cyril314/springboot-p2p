<%@ page language="java" pageEncoding="utf-8" %>
<%@include file="./taglib.jsp" %>
<!--底部快捷导航 开始-->
<!--friend start-->
<div class="friend">
    <div class="center">
        <ul>
            <li>友情链接：</li>
            <li><a target="_blank" href="http://www.siilu.com/">电商服务</a></li>
            <li><a target="_blank" href="http://www.shanghai-cis.com.cn/index2.aspx">上海资信</a></li>
            <li><a target="_blank" href="http://www.wangdaisky.com">网贷门户</a></li>
            <li><a target="_blank" href="http://www.wdzx.com/">网贷中心</a></li>
            <li><a target="_blank" href="http://credit.hc360.com/dk_index/hc_dk.html">慧聪金融</a></li>
            <li><a target="_blank" href="http://www.p2peye.com/">网贷天眼</a></li>
            <li><a target="_blank" href="http://www.wangdaizhijia.com/">网贷之家</a></li>
            <li><a target="_blank" href="http://www.wdlm.cn/">网贷联盟</a></li>
        </ul>
    </div>
</div>
<div class="clear"></div>
<!--friend end-->
<!--bottom start-->
<div class="bottom">
    <div class="center">
        <div class="left">
            <div>
                <a href="getMessageBytypeId.do?typeId=4">关于我们</a> |
                <a href="callcenter.do">帮助中心</a> |
                <a href="getMessageBytypeId.do?typeId=4&t=10">法律政策</a> |
                <a href="downloads.do">下载专区</a> |
                <a href="rechargePageInit.do">充值提现</a> |
                <a href="voteCalculator.do">收益计算器</a> |
                <a href="html/nav.html">网站地图</a> |
            </div>
            <div>
                客服邮箱：<span class="email">${sitemap.emial }</span><br/>
                全国客服咨询热线：<span class="phone">${sitemap.servicePhone }</span>（工作日9:00~21:00）
            </div>
        </div>
        <div class="right">
            <table>
                <tr>
                    <td>
                        <a href="http://t.qq.com/haoleyidai" target="_blank">
                            <img src="${ctx}/static/images/txwb.jpg"/>
                        </a><br/>腾讯微博
                    </td>
                    <td>
                        <a href="http://weibo.com/okleyi" target="_blank">
                            <img src="${ctx}/static/images/sina.jpg"/>
                        </a><br/>新浪微博
                    </td>
                    <td><a href="javascript:void(0)" onMouseOver="showpop('mydiv1')" onMouseOut="hidepop('mydiv1')">
                        <img src="${ctx}/static/images/weixin.jpg"/></a><br/>官方微信
                        <div id="mydiv1" class="wx-pop">
                            <img src="${ctx}/static/images/Wechat.jpg" style="width: 150px;height: 150px"/>
                        </div>
                    </td>
                    <td>
                        <a id="launchBtn" class="btnText onlineBtnText btn" target="_blank"
                           href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4006644518&aty=0&a=0&curl=&ty=1">
                            <img src="${ctx}/static/images/QQ.jpg"/>
                        </a><br/>QQ客服
                    </td>
                    <td><a href="javascript:void(0)" onMouseOver="showpop('mydiv2')" onMouseOut="hidepop('mydiv2')"><img
                            src="${ctx}/static/images/client.jpg"/></a><br/>客户端下载
                        <div id="mydiv2" class="khd-pop">
                            <table>
                                <tr>
                                    <td><img src="${ctx}/static/images/C_ewm.jpg"/><br/>ANDROID</td>
                                    <td><img src="${ctx}/static/images/IOS.png"/><br/>IOS</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="com left">
            版权所有 © 2014 好乐易贷 All rights reserved | <a href="http://www.okleyi.com" target="_blank">www.okleyi.com</a>
            | 备案号：${sitemap.certificate }<br/>
            <a href="https://search.szfw.org/cert/l/CX20140515008062008128" target="_blank">
                <img style="width: 112px;height: 42px" src="${ctx}/static/images/logo_new.png"/>
            </a>
            <a href="https://ss.knet.cn/verifyseal.dll?sn=e14051613010048992b6pj000000&ct=df&a=1&pa=0.10254721995443106"
               target="_blank"><img src="${ctx}/static/images/icon1.jpg"/>
            </a>
        </div>
    </div>
</div>
<!--bottom end-->
<!--底部footer 结束-->
<!-- 浮动位置 -->
<div id="top"></div>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<!-- 浮动位置End -->
<script type="text/javascript" src="${ctx}/static/js/backtop.js"></script>
<!--backtop js-->
<script type="text/javascript" src="${ctx}/static/js/raphael-min.js"></script>
<!--百分比 js-->
<script type="text/javascript" src="${ctx}/static/js/round.js"></script>
<!--百分比 js-->
<script type="text/javascript" src="${ctx}/static/js/xl.js"></script>
<script type="text/javascript" src="${ctx}/static/js/public.js"></script>
<script type="text/javascript">
    $(function () {
        $(window).scroll(function () {
            if ($(window).scrollTop() >= 109) {
                $(".nav-zdh").css("position", "fixed")
            } else {
                $(".nav-zdh").css("position", "relative")
            }
        })
        $("#launchBtn").removeClass("launchBtn");
        $("#launchBtn").removeClass("bg");
    });

    function showpop(id) {//底部二维码的显示js
        var objDiv = document.getElementById(id);
        objDiv.style.display = "block";
    }

    function hidepop(id) {//底部二维码的隐藏js
        var objDiv = document.getElementById(id);
        objDiv.style.display = "none";
    }
</script>