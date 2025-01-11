<%@ page language="java" pageEncoding="utf-8" %>
<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css"/>

<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="${ctx}/static/js/public.js"></script>
<script type="text/javascript" src="${ctx}/static/js/tab.js"></script>
<!--选项卡 js-->
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<style type="text/css">
    /*今日签到*/
    .singer_r_img {
        display: block;
        width: 114px;
        height: 52px;
        background: url(/static/images/sign_week.gif) right 2px no-repeat;
    }

    .singer_r_img:hover {
        background-position: right -53px;
        text-decoration: none;
    }

    .singer_r_img span {
        display: block;
        padding-top: 11px;
        margin-left: 14px;
        font-size: 16px;
        font-weight: 700;
        color: #288fca;
    }

    .singer_r_img.current {
        background: url(/static/images/sign.gif) no-repeat 0 2px;
    }
</style>
<script>
    function pastpictur() {
        jBox.open("post:pastpicture.do", "上传头像", 500, 150, {
            buttons: {
                "关闭": true
            }
        });
    }

    function uploadCall(basepath, fileName, cp) {
        if (cp == "img") {
            var path = "upload/" + basepath + "/" + fileName;
            $("#img").attr("src", path);
            param['paramMap.imgPath'] = path;
            $.shovePost("updatePersonImg.do", param, uploadCallBack);
        }
    }

    function uploadCallBack(data) {
        alert(data.msg);
    }

    function leftOn(li, dd) {
        $("#left > li > dl > dd").removeClass("on");
        $("#left > li > dl").removeClass("on");
        $("#" + dd).addClass("on");
        $('#' + li + " > a").css("background", "url(images/t03.png) 15px 6px no-repeat #fc5704");
        $('#' + li + " > a").css("color", "#fff");
    }

    function mynav(obj, num) {
        SetCookie('mynav', 'mynav' + num);
        SetCookie('acc_menu', 'acc_menu' + num);
        window.location.href = obj;
    }

    function SetCookie(name, value) {//两个参数，一个是cookie的名子，一个是值
        var Days = 1; //此 cookie 将被保存1 天
        var exp = new Date();    //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }

    /*暂时没用 */
    function setCook(zqzr) {
        SetCookie('zqzr_cookie', zqzr, "s5");
    }
</script>
<script type="text/javascript">
    /*签到模块日期捕捉：*/
    function week() {
        var objDate = new Date();
        var week = objDate.getDay();
        switch (week) {
            case 0:
                week = "周日";
                break;
            case 1:
                week = "周一";
                break;
            case 2:
                week = "周二";
                break;
            case 3:
                week = "周三";
                break;
            case 4:
                week = "周四";
                break;
            case 5:
                week = "周五";
                break;
            case 6:
                week = "周六";
                break;
        }
        $("#sing_for_number").html(week);
    }

    $(document).ready(function () {
        week();
        $.post("querySignInBankRecharge.do", function (data) {
            //已签到
            if (data.SignInBankRecharge == 0) {
                var signInMoney = data.signInMoney;
                $("#unSignInMoney").text(signInMoney);
                $(".singer_r_img").addClass("current");
                $("#onSignedIn")[0].style.display = 'none';
                $("#unSignedIn")[0].style.display = 'block';
            }
            //未签到
            if (data.SignInBankRecharge == -1) {
                var signInMoney = data.signInMoney;
                $("#onSignInMoney").text(signInMoney);
                $("#unSignedIn")[0].style.display = 'none';
                $("#addSignInBankRecharge").click(function () {
                    $("#addSignInBankRecharge")[0].style.display = 'none';
                    $.post("addSignInBankRecharge.do", function () {
                        window.location.reload(true);
                    });
                    $(".singer_r_img").addClass("current");
                })
            }
        });
    })
</script>
<div class="acc_content" style="height: 267px;">
    <div class="acc_mes left">
        <table class="tabmes" cellpadding="0" cellspacing="0">
            <tr>
                <td rowspan="4" width="110">
                    <a href="javascript:void(0);" onclick="pastpictur()">
                        <img src="${user.personalHead?'/static/images/default-img.jpg' }" width="103px" height="103px"/>
                    </a>
                </td>
                <td class="p10" width="260">
                    <span title="${user.userName}">${fn:substring(user.userName,0,10)}</span>，您好！
                </td>
                <td rowspan="2" style="border-left: 1px solid #c7c7c7; padding-left: 30px;">
                    <c:if test="${user.vipStatus==2}">
                        <a id="addSignInBankRecharge" class="singer_r_img" href="javascript:void(0);">
                            <span id="sing_for_number"></span>
                        </a>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td class="p10">当前积分：${user.rating }</td>
            </tr>
            <tr>
                <td class="p10">会员等级：
                    <c:if test="${user.vipStatus==2}">
                        <img src="${ctx}/static/images/VIP.jpg"/>&nbsp;&nbsp;尊贵VIP
                    </c:if>
                    <c:if test="${user.vipStatus!=2}"><img src="${ctx}/static/images/VIPno.jpg"/>
                        &nbsp;&nbsp;<a href="quervipData.do">成为VIP</a>
                    </c:if>
                </td>
                <c:if test="${user.vipStatus==2}">
                    <td rowspan="2" style="border-left: 1px solid #c7c7c7; padding-left: 30px;">
                        <span id="onSignedIn">每日签到赢取<span id="onSignInMoney"></span>元理财金！</span>
                        <span id="unSignedIn" style="display: none">您已成功签到获得<span id="unSignInMoney"></span>元理财金！</span>
                    </td>
                </c:if>
                <c:if test="${user.vipStatus!=2}">
                    <td></td>
                </c:if>
            </tr>
            <tr>
                <td class="p10">
                    <c:if test="${user.authStep==1}">
                        <a href="querBaseData.do" title="未填写个人信息"><img src="${ctx}/static/images/grxx.jpg"/> 个人信息</a>
                    </c:if>
                    <c:if test="${user.authStep!=1}">
                        <a href="querBaseData.do" title="已填写个人信息"><img src="${ctx}/static/images/grxx.jpg"/> 个人信息</a>
                    </c:if>
                    <c:if test="${user.cellPhone!=null && user.cellPhone.length()>0}">
                        <a href="javascript:void(0);" onClick="mynav('reBindingMobileInit.do','1');"
                           title="已绑定手机号码"><img src="${ctx}/static/images/bdsj.jpg"/> 绑定手机</a>
                    </c:if>
                    <c:if test="${user.cellPhone==null || user.cellPhone.length()==0}">
                        <a href="javascript:void(0);" onClick="mynav('bindingMobileInit.do','1');"
                           title="未绑定手机号码"><img src="${ctx}/static/images/bdsj.jpg"/> 绑定手机</a>
                    </c:if>
                    <c:if test="${user.dealpwd==user.password}">
                        <a href="javascript:void(0);" onClick="mynav('changeDealpwdInit.do','1');"
                           title="提现密码和登录密码一致,不安全"><img src="${ctx}/static/images/xgmm.jpg"/> 修改提现密码</a>
                    </c:if>
                    <c:if test="${user.dealpwd!=user.password}">
                        <a href="javascript:void(0);" onClick="mynav('changeDealpwdInit.do','1');"
                           title="提现密码和登录密码不一致,安全"><img src="${ctx}/static/images/xgmm.jpg"/> 修改提现密码</a>
                    </c:if>
                </td>
            </tr>
        </table>
        <div class="tabmon">
            <table>
                <tr>
                    <td>账户总额:<span class="spanmon">￥<c:out value="${accmountStatisMap.accountSum}" default="0.00"/></span></td>
                    <td>冻结金额:<span class="spanmon">￥<c:out value="${accmountStatisMap.freezeAmount}" default="0.00"/></span></td>
                    <td>可用余额:<span class="spanmon">￥<c:out value="${accmountStatisMap.usableAmount}" default="0.00"/></span></td>
                </tr>
                <tr>
                    <td>
                        <span class="span12" title="您好！理财专用金是网站给予奖励总额，VIP用户可以用来投资，但不可以提现">理财专用金总额:</span>
                        <span class="span12mon">￥<c:out value="${accmountStatisMap.goldSum}" default="0.00"/></span>
                    </td>
                    <td>
                        <span class="span12">冻结理财金金额:</span>
                        <span class="span12mon">￥<c:out value="${accmountStatisMap.freezeGold}" default="0.00"/></span>
                    </td>
                    <td>
                        <span class="span12">理财专用金可用额：</span>
                        <span class="span12mon">￥<c:out value="${accmountStatisMap.usableGold}" default="0.00"/></span>
					</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center" style="padding-top: 20px;">
                        <input type="button" class="btncz" onmouseover="this.className='btnczhover'"
                               onmouseout="this.className='btncz'" onClick="mynav('rechargeInit.do','2');"/>
                        <input type="button" class="btntx" onmouseover="this.className='btntxhover'"
                               onmouseout="this.className='btntx'" onClick="mynav('withdrawLoad.do','2');"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="acc_quick left">
        <table cellpadding="0" cellspacing="0" class="tabquick">
            <tr>
                <td><a href="javascript:;" onClick="mynav('rechargeInit.do','2');" class="a1">&nbsp;</a></td>
                <td><a href="finance.do" class="a2">&nbsp;</a></td>
                <td><a href="javascript:;" onclick="mynav('queryCanAssignmentDebtInit.do','5');" class="a3">&nbsp;</a></td>
                <td><a href="javascript:;" onClick="mynav('queryMyPayingBorrowInit.do','4');" class="a4">&nbsp;</a></td>
            </tr>
            <tr>
                <td>我要充值</td>
                <td>我要贷出</td>
                <td>债权转让</td>
                <td>我要还款</td>
            </tr>
            <tr>
                <td><a href="javascript:;" onClick="mynav('homeBorrowRecycleInit.do','3');" class="a5">&nbsp;</a></td>
                <td><a href="javascript:;" onClick="mynav('queryFundrecordInit.do','3');" class="a6">&nbsp;</a></td>
                <td><a href="borrow.do" class="a7">&nbsp;</a></td>
                <td></td>
            </tr>
            <tr>
                <td>待收款</td>
                <td>流水资金</td>
                <td>我要借款</td>
                <td></td>
            </tr>
        </table>
    </div>
    <div class="clear"></div>
</div>