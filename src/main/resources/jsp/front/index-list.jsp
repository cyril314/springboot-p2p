<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/css/style.css"/>
    <script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/banner.js"></script><!--banner js-->
    <script type="text/javascript" src="${ctx}/static/js/jquery.easing.js"></script><!--acti-banner js-->
    <script type="text/javascript" src="${ctx}/static/js/acti-banner.js"></script><!--acti-banner js-->
    <script type="text/javascript" src="${ctx}/static/js/public.js"></script><!--二维码显示隐藏 js-->
</head>
<body onload="javascript:init();">
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- END引用头部公共部分 -->
<!--banner start-->
<div class="banner">
    <!--login start-->
    <c:if test="#session.user==null">
        <form action="logining.do" method="post">
            <div class="login">
                <div class="login-c">
                    <div class="login-top">用户登录</div>
                    <div class="login-middle">
                        <span id="s_email"></span>
                        <span id="email_" style="display: none;"><a id="retake_email" href="javascript:reSendEmail();">发送激活邮件</a></span>
                        <span id="s_password"></span>
                        <span id="s_code"></span>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <input type="text" class="txtuser" name="paramMap.email" id="email"
                                           value="手机号、邮箱或用户名"
                                           onfocus="if(value=='手机号、邮箱或用户名') {this.style.color='#000';value=''}"
                                           onblur="if (value=='') {this.style.color='#CCC';value='手机号、邮箱或用户名'}"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="password" class="txtpwd" name="paramMap.password" id="password"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="text" class="txtcod" name="paramMap.code" id="code" maxlength="4"/>
                                    <img src="admin/imageCode.do?pageId=userlogin" title="点击更换验证码" id="codeNum"
                                         onclick="javascript:switchCode()"/>
                                    <a href="javascript:;" onclick="switchCode()" style="font-size: 14px;">换一换</a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="button" class="btnlogin" value="立 即 登 录" id="btn_login"
                                           onmouseover="this.className='btnloginhover'"
                                           onmouseout="this.className='btnlogin'"/>
                                </td>
                            </tr>
                            <tr>
                                <td align="left"><a href="forgetpassword.do">忘记密码？</a></td>
                                <td align="right">
                                    <span>还没有账号？<a href="javascript:;" onclick="myindex('reg.do','1')">立即注册</a></span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </form>
    </c:if>
    <!--login end-->
    <!--PIC start-->
    <ul id="slides">
        <c:if test="${bannerList.size()>0}">
            <c:forEach items="${bannerList}" var="banner" varStatus="sta">
                <li title="${banner.companyName}" style="background:url('${banner.companyImg }') no-repeat center top"
                    onclick="test('${banner.id}')"/>
            </c:forEach>
        </c:if>
        <c:if test="${bannerList.size()<1}">
            <li style="background:url('${ctx}/static/images/02.jpg') no-repeat center top"></li>
            <li style="background:url('${ctx}/static/images/03.jpg') no-repeat center top"></li>
            <li style="background:url('${ctx}/static/images/04.jpg') no-repeat center top"></li>
            <li style="background:url('${ctx}/static/images/05.jpg') no-repeat center top"></li>
        </c:if>
    </ul>
    <!--pic end-->
</div>
<div class="clear"></div>
<!--banner end-->
<!--three start-->
<div class="three">
    <div class="center">
        <div class="three-content1 left">
            <div class="three-content1-top"><a href="getMessageBytypeId.do?typeId=35">投资理财</a></div>
            <div class="three-content1-middle">
                <div class="three-content1-middle-content">
                    <a href="getMessageBytypeId.do?typeId=35" class="icon1"></a>
                    <a href="getMessageBytypeId.do?typeId=35"><img src="${ctx}/static/images/th-word1.jpg"/></a>
                    <a href="getMessageBytypeId.do?typeId=35"><p>100元起步，<br/>最高20%得年化收益。</p></a>
                </div>
            </div>
        </div>
        <div class="three-content2 left m36">
            <div class="three-content2-top"><a href="getMessageBytypeId.do?typeId=36">借款融资</a></div>
            <div class="three-content2-middle">
                <div class="three-content2-middle-content">
                    <a href="getMessageBytypeId.do?typeId=36" class="icon2"></a>
                    <a href="getMessageBytypeId.do?typeId=36"><img src="${ctx}/static/images/th-word2.jpg"/></a>
                    <a href="getMessageBytypeId.do?typeId=36"><p>4步申请，最快当天放款；<br/>低成本，高额度。</p></a>
                </div>
            </div>
        </div>
        <div class="three-content3 left m36">
            <div class="three-content3-top"><a href="getMessageBytypeId.do?typeId=37">安全保障</a></div>
            <div class="three-content3-middle">
                <div class="three-content3-middle-content">
                    <a href="getMessageBytypeId.do?typeId=37" class="icon3"></a>
                    <a href="getMessageBytypeId.do?typeId=37"><img src="${ctx}/static/images/th-word3.jpg"/></a>
                    <a href="getMessageBytypeId.do?typeId=37"><p>100%本金保障<br/>次债回收+风险准备金</p></a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<!--最新公告 start -->
<div class="notice">
    <div class="noticecenter">
        <div class="noticecenterall">
            最新公告:
            <c:if test="${ZxggMap != null}">
                <a href="getMessageBytypeId.do?typeId=4&t=7&id=${ZxggMap.id}">${ZxggMap.title}</a>
                <span>
                    <fmt:formatDate value="${ZxggMap.publishTime}" pattern="yyyy-MM-dd" />
                    <a href="getMessageBytypeId.do?typeId=4&t=7">查看更多 &gt;&gt;</a>
                </span>
            </c:if>
            <c:if test="${ZxggMap == null}">暂无公告</c:if>
        </div>
    </div>
</div>
<!--最新公告 end -->
<!--activity start-->
<div class="acitvity">
    <div class="acitvity-top">进行中的活动</div>
    <div id="slideshow">
        <div id="slidesContainer">
            <!-- 活动① -->
            <div class="slide">
                <div class="innerslidebox">
                    <div class="activity-content">
                        <table>
                            <tr>
                                <td rowspan="2">
                                    <a href="${ctx}/html/SendVIPActivities.html" target="_blank">
                                        <img src="${ctx}/upload/lists/20141001/newActy.jpg" />
                                    </a>
                                </td>
                                <td class="p20">
                                    <p>
                                        活动名称：会员节 又一大波奖金来袭<br/>
                                        活动时间：2014年10月1日-2014年10月31日<br/>
                                        活动对象：新老用户、购买VIP用户 <br/>
                                        活动内容：1、注册投资即送VIP 2、VIP每天签到10元理财金3、推荐好友VIP
                                        100元理财金/人4、微博、微信活动现金、IPhone 6乐享不停！
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td class="p20">
                                    <input type="button" class="btnJoin" onclick="Goto()"
                                           onmouseover="this.className='btnJoinhover'"
                                           onmouseout="this.className='btnJoin'"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="clearfloat"></div>
                </div>
            </div>
            <!-- 活动② -->
            <div class="slide">
                <div class="innerslidebox">
                    <div class="activity-content">
                        <table>
                            <tr>
                                <td rowspan="2">
                                    <a href="${ctx}/html/InviteFriends.html" target="_blank">
                                        <img src="${ctx}/upload/lists/20141001/InviteFriends.jpg"/>
                                    </a>
                                </td>
                                <td class="p20">
                                    <p>
                                        活动名称：邀请好友得100元奖金<br/>
                                        活动时间：2014年10月1日—2014年10月31日<br/>
                                        活动对象：新注册用户、购买VIP用户、投资用户 <br/>
                                        活动内容：邀请好友成为VIP,100元理财金/人，上不封顶！
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td class="p20">
                                    <input type="button" class="btnJoin" onclick="goTo()"
                                           onmouseover="this.className='btnJoinhover'"
                                           onmouseout="this.className='btnJoin'"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="clearfloat"></div>
                </div>
            </div>
            <!-- 进行中的活动End -->
        </div>
        <ul id="controlpanel">
            <li class="control" id="leftControl"></li>
            <li id="slideIndex" style="display: none;"></li>
            <li class="control" id="rightControl"></li>
        </ul>
    </div>
</div>
<div class="clear"></div>
<!--activity end-->
<c:if test="${mapList.size()>0}">
    <!--list start-->
    <div class="list">
        <div class="center">
            <div class="acitvity-top">进行中的借款</div>
            <div class="moneyall">
                <c:forEach items="${mapList}" var="finance" varStatus="st">
                    <!--列表项 start-->
                    <div class="money left" onclick="window.open('financeDetail.do?id=${finance.id}','_blank')">
                        <div class="money-top">
                            <div class="left">
                                <span class="class">
                                    <img src="${ctx}/static/${finance.imgPath}" title="${finance.borrowTitle}"/>
                                 </span>
                                <a title="${finance.borrowTitle }">${fn:substring(finance.borrowTitle,0,2)}</a>
                            </div>
                            <div class="right">
                                <span class="type">
                                    <c:if test="${finance.borrowMethod==1}">净</c:if>
                                    <c:if test="${finance.borrowMethod==3}">信</c:if>
                                    <c:if test="${finance.borrowMethod==4}">实</c:if>
                                    <c:if test="${finance.borrowMethod==5}">担</c:if>
                                </span>
                                <span class="jiang">奖
                                    <c:if test="${finance.excitationType==1}"> - - </c:if>
                                    <c:if test="${finance.excitationType==2}">￥${finance.excitationSum}</c:if>
                                    <c:if test="${finance.excitationType==3}">${finance.excitationSum}%</c:if>
                                </span>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="money-middle">
                            <div id="bg${st.index}"></div>
                            <!-- 进度圆圈 -->
                            <div id="txt${st.index}" class="pertxt">
<%--                                <input type="hidden" id="qz${st.index}" value="${finance.schedules}"/>--%>
                            </div>
                            <!-- 承载进度文字 -->
                        </div>
                        <div class="clear"></div>
                        <div class="money-bottom">
                            <div style="width: 100%; height: 70px;clear:both">
                                <div class="mes left">借款总额<br/>
                                    <strong>${finance.borrowAmount}</strong>
                                </div>
                                <div class="mes left m2">期限<br/>
                                    <strong>
                                        ${finance.deadline}
                                        <c:if test="${finance.isDayThe ==1}">个月</c:if>
                                        <c:if test="${finance.isDayThe !=1}">天</c:if>
                                    </strong>
                                </div>
                                <div class="mes left m2">年利率<br/>
                                    <strong>${finance.annualRate}</strong>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <c:choose>
                                <c:when test="${finance.borrowStatus == 1}">
                                    <a href="javascript:void(0)" class="noqtb">初审中</a>
                                </c:when>
                                <c:when test="${finance.borrowStatus == 2}">
                                    <div class="bottm">
                                        <c:if test="%{#finance.borrowShow == 2}">
                                            <a class="tb_btn">认购</a>
                                        </c:if>
                                        <c:if test="%{#finance.borrowShow != 2}">
                                            <a class="qtb">去投标</a>
                                        </c:if>
                                    </div>
                                </c:when>
                                <c:when test="${finance.borrowStatus == 3}">
                                    <a href="javascript:void(0)" class="noqtb"> 复审中 </a>
                                </c:when>
                                <c:when test="${finance.borrowStatus == 4}">
                                    <a href="javascript:void(0)" class="noqtb">
                                        <c:if test="%{#finance.borrowShow == 2}">回购中</c:if>
                                        <c:if test="%{#finance.borrowShow != 2}">还款中</c:if>
                                    </a>
                                </c:when>
                                <c:when test="${finance.borrowStatus == 5}">
                                    <a href="javascript:void(0) " class="noqtb">已还完</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)" class="noqtb">流标</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="clear"></div>
                    </div>
                </c:forEach>
                <!--列表项 end-->
                <!-- 查看更多 Strat -->
                <input type="button" onclick="myindex('finance.do','2')" class="btn3"
                       onmouseover="this.className='btn3hover'" onmouseout="this.className='btn3'"/>
                <!-- 查看更多 End -->
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <!--list end-->
</c:if>
<c:if test="mapList.size()<1">
    <li style="text-align: center;">没有数据</li>
</c:if>
<!--news start-->
<div class="news">
    <div class="center">
        <div class="newslist left">
            <div class="news-top">
                <span class="left">网站公告</span>
                <span class="right">
                    <a href="javascript:;" onClick="myindex('getMessageBytypeId.do?typeId=4&t=7','5')">查看更多>></a>
                </span>
            </div>
            <div class="news-middle">
                <ul>
                    <c:forEach items="${newsList}" var="bean">
                        <li>
                            <a href="getMessageBytypeId.do?typeId=4&t=7&id=${bean.id }" title="${bean.title }"
                               target="_blank">${bean.title }</a>
                            <span><fmt:formatDate value="${bean.publishTime}" pattern="yyyy-MM-dd" /></span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="newslist left">
            <div class="news-top">
                <span class="left">媒体报道</span>
                <span class="right"><a href="getMessageBytypeId.do?typeId=4&t=11">查看更多>></a></span>
            </div>
            <div class="news-middle">
                <ul>
                    <c:forEach items="${meikuList}" var="nw">
                        <li>
                            <a href="getMessageBytypeId.do?typeId=4&t=11&id=${nw.id}" title="${nw.title }"
                               target="_blank">${nw.title}</a>
                            <span><fmt:formatDate value="${nw.publishTime}" pattern="yyyy-MM-dd" /></span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<!--news end-->
<!-- 引用底部公共部分-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.jslides.js"></script>
<script type="text/javascript" src="${ctx}/static/js/slide.js"></script>
<script type="text/javascript">
    $().ready(function () {
        $('#slideshow').slide({autoplay: true, duration: 5000, showSlideNumber: true});
    });
</script>
<script type="text/javascript">
    $(function () {
        dqzt(0);
    });

    function Goto() {
        window.open("html/SendVIPActivities.html", "_blank");
    }

    function goTo() {
        window.open("html/InviteFriends.html", "_blank");
    }

    function test(id) {
        window.open('getMessageBytypeId.do?typeId=40&id=' + id);
    }

    function test2(obj) {//跳转到指定页面
        window.open(obj);
    }

    function clickBanner(banner) {
        window.open(banner, "_blank");
    }
</script>
<script>
    $(function () {
        $("#code").bind('keyup', function (event) {
            if (event.keyCode == "13") {
                login();
            }
        });
        $("#email").bind('keyup', function (event) {
            if (event.keyCode == "13") {
                login();
            }
        });
        $("#password").bind('keyup', function (event) {
            if (event.keyCode == "13") {
                login();
            }
        });
        //样式选中
    })

    //初始化
    function switchCode() {
        var timenow = new Date();
        $("#codeNum").attr("src", "admin/imageCode.do?pageId=userlogin&d=" + timenow);
    }

    $(document).ready(function () {
        //===========input失去焦点
        $("form :input").blur(function () {
            //email
            if ($(this).is("#email")) {
                if (this.value == "") {
                    $("#s_email").attr("class", "formuser onError");
                    $("#s_email").html("*请输入用户名或邮箱地址");
                } else if (/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(this.value)) { //判断用户输入的是否是邮箱地址
                    checkRegister('email');
                } else if ((/^1[3,5,8]\d{9}$/.test(this.value))) {
                    checkRegister('cellphone');
                } else {
                    checkRegister('userName');
                    $("#s_email").attr("class", "formuser");
                }
            }
            //password
            if ($(this).attr("id") == "password") {
                pwd = this.value;
                if (this.value == "") {
                    $("#s_password").attr("class", "formpwd onError");
                    $("#s_password").html("*请輸入您的密码");
                } else if (this.value.length < 6) {
                    $("#s_password").attr("class", "formpwd onError");
                    $("#s_password").html("*密码长度为6-20个字符");
                } else {
                    $("#s_password").html("");
                    $("#s_password").attr("class", "");
                }
            }
            //验证码
            if ($(this).attr("id") == "code") {
                if (this.value == "") {
                    $("#s_code").attr("class", "formcod onError");
                    $("#s_code").html("*请输入验证码");
                } else {
                    $("#s_code").attr("class", "");
                    $("#s_code").html("");
                }
            }
        });
        getCookie();
    });

    //===验证数据
    function checkRegister(str) {
        var param = {};
        if (str == "userName") {
            param["paramMap.email"] = "";
            param["paramMap.userName"] = $("#email").val();
        } else if (str == "email") {
            param["paramMap.email"] = $("#email").val();
            param["paramMap.userName"] = "";
        } else {
            param["paramMap.email"] = "";
            param["paramMap.userName"] = "";
            param["paramMap.cellphone"] = $("#email").val();
        }
        $.post("ajaxCheckLog.do", param, function (data) {
            $("#email_").hide();
            if (data == 2 && str == "userName") {
                $("#s_email").html("*无效用户！");
            } else if (data == 3 && str == "userName") {
                $("#s_email").html("*该用户还没激活！");
                //add by houli
                $("#email_").show();
            } else if (data == 4 && str == "userName") {
                $("#s_email").attr("class", "formtips");
                $("#s_email").html("");
            }
            if (data == 0 && str == "email") {
                $("#s_email").html("*无效邮箱！");
            } else if (data == 1 && str == "email") {
                $("#s_email").html("*该邮箱用户还没激活！");
                //add by houli
                $("#email_").show();
            } else if (data == 4 && str == "email") {
                $("#s_email").attr("class", "formtips");
                $("#s_email").html("");
            }
            if (data == 5 && str == "cellphone") {
                $("#s_email").html("*用户不存在！");
            } else if (data == 4 && str == "cellphone") {
                $("#s_email").html("");
            }
        });
    }
</script>
<script>
    function login() {
        $(this).attr('disabled', true);
        if ($("#email").val() == "") {
            $("#s_email").attr("class", "formuser onError");
            $("#s_email").html("*请输用户名或邮箱地址");
        }
        if ($("#password").val() == "") {
            $("#s_password").attr("class", "formpwd onError");
            $("#s_password").html("*请输入密码");
            // $("#retake_password").hide();
        }
        //$('#btn_login').attr('value','登录中...');
        var param = {};
        param["paramMap.pageId"] = "userlogin";
        param["paramMap.email"] = $("#email").val();
        param["paramMap.password"] = $("#password").val();
        param["paramMap.code"] = $("#code").val();
        param["paramMap.afterLoginUrl"] = "${session.afterLoginUrl}";
        $.post("logining.do", param, function (data) {
            if (data == 1) {
                var afterLoginUrl = '${session.afterLoginUrl}';
                if (afterLoginUrl != '') {
                    window.location.href = '${session.afterLoginUrl}';
                } else {
                    window.location.href = 'home.do';
                }
                var checkday = $('#checkday').val();
                if (checkday > 0) {
                    var email = $('#email').val();
                    addCookie('email', email, checkday);
                }
            } else if (data == 2) {
                //$('#btn_login').attr('value','登录');
                $("#s_code").attr("class", "formcod onError");
                $("#s_code").html("*验证码错误！");
                switchCode();
                $("#btn_login").attr('disabled', false);
            } else if (data == 3) {
                //$('#btn_login').attr('value','登录');
                $("#s_email").attr("class", "formuser onError");
                $("#s_email").html("*用户名或密码错误！");
                switchCode();
                $("#btn_login").attr('disabled', false);
            } else if (data == 4) {
                // $('#btn_login').attr('value','登录');
                $("#s_email").attr("class", "formuser onError");
                switchCode();
                $("#s_email").html("*该用户已被禁用！");
                $("#btn_login").attr('disabled', false);
            }
        });
    }

    function reSendEmail() {
        if ($("#email").val() == "") {
            alert("请输入邮箱");
            return;
        }
        window.location.href = "reActivateEmail.do?email=" + $("#email").val();
    }

    $("#btn_login").click(function () {
        login();
    });

    function addCookie(objName, objValue, days) {
        var str = objName + "=" + escape(objValue);
        if (days > 0) {
            var date = new Date();
            var ms = days * 24 * 3600 * 1000;
            date.setTime(date.getTime() + ms);
            str += "; expires=" + date.toGMTString();
        }
        document.cookie = str;
    }

    function getCookie() {
        //取出cookies
        var arrStr = document.cookie.split("; ");
        for (var i = 0; i < arrStr.length; i++) {
            var temp = arrStr[i].split("=");
            if (temp[0] == 'email') {
                var userName = unescape(temp[1]);
                $('#email').val(userName);
            }
        }
    }

    function myindex(obj, num) {
        SetCookie('topmenu', 'topmenu' + num);
        window.location.href = obj;
    }

    function SetCookie(name, value) {//两个参数，一个是cookie的名子，一个是值
        var Days = 1; //此 cookie 将被保存1 天
        var exp = new Date();    //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }
</script>
</body>
</html>
