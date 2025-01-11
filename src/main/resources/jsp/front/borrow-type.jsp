<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
<style>
.nymain{ width: 990px; margin:0 auto; overflow: hidden; height: auto; color: #666; background:#FFF; border: 1px solid #c7c7c7;}
.nymain .bigbox .sqdk .l-nav { background: #FFF; float: left; width: 152px; }
.nymain .bigbox .sqdk .l-nav ul li { text-align: center; border-bottom: 1px solid #c7c7c7; line-height: 50px; }
.nymain .bigbox .sqdk .l-nav ul .last { }
.nymain .bigbox .sqdk .l-nav ul li a {font-size: 14px; color: #3a5269; display: block; }
.nymain .bigbox .sqdk .l-nav ul li a:hover { color: #3a5269; background-color: #e9ebeb; }
.nymain .bigbox .sqdk .l-nav ul .on a { color: #3a5269; background:#e9ebeb; line-height: 50px; }
.nymain .bigbox .sqdk .r-main { float: left; width: 834px; border-left: 1px solid #c7c7c7; }
.nymain .bigbox .sqdk .r-main .rmainbox { padding-right: 30px; padding-left: 30px; padding-bottom: 40px; position: relative; background: #FFF; }
.nymain .bigbox .sqdk .r-main .rmainbox .fbdk { padding-top: 10px; }
.nymain .bigbox .sqdk .r-main .rmainbox .fbdk ul li { line-height: 40px; color: #999; padding:25px 0 25px 20px; overflow: hidden; height: 100%; border-bottom: 1px dotted #CCC;  }
.nymain .bigbox .sqdk .r-main .rmainbox .fbdk ul li .btn { float: left; height: 100%; width: 136px; padding-right: 25px; vertical-align: baseline; }
.nymain .bigbox .sqdk .r-main .rmainbox .fbdk ul li .btn a { font-size: 14px; line-height: 38px; color: #FFF; text-align: center; display: block; height: 40px; width: 136px; }
.nymain .bigbox .sqdk .r-main .rmainbox .fbdk ul li .btn a:hover { color: #FFF; }
.nymain .bigbox .sqdk .r-main .rmainbox .fbdk ul li p { float: left; width: 580px; }
</style>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
<form id="form" action="addBorrow.do" method="post">
<div class="nymain">
<div class="bigbox" style="border:none">
<div class="sqdk">
	<div class="l-nav">
    <ul>
    <li><a href="querBaseData.do"><span>step1</span> 基本资料</a></li>
    <li><a href="userPassData.do"><span>step2</span>上传资料</a></li>
    <li class="on last"><a href="javascript:void(0);"><span>step3</span> 发布贷款</a></li>
    </ul>
    </div>
    <div class="r-main">
   <div class="rmainbox">
		<div class="fbdk">
        <ul><li>
          <div class="btn">
          <a href="addBorrowInit.do?t=3" class="update">信用借款</a>
          </div>
          <p>纯信用贷款，贷款年利率在${minRate }-${maxRate }%之间，额度较小。</p>
        </li><li>
          <div class="btn">
          <a href="addBorrowInit.do?t=4" class="update">实地考察借款</a>
          </div>
          <p>小微企业现场考察审批，需要通过现场认证。（实地认证借款能选择性添加抵押标志）</p>
        </li><li>
          <div class="btn">
          <a href="addBorrowInit.do?t=5" class="update">机构担保借款</a>
          </div>
          <p>是指好乐易贷的合作伙伴为相应的借款提供连带保证，并负有连带保证责任的借款。（机构担保标需要通过机构担保认证）</p>
                         
        </li>
        </ul>
        </div>
    </div>
    </div>
  </div>
  </div>
</div>
</form>
</div>
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/xl.js"></script>
<script>
$(function(){
    //样式选中
  var sd=parseInt($(".l-nav").css("height"));
    var sdf=parseInt($(".r-main").css("height"));
	 $(".l-nav").css("height",sd>sdf?sd:sdf-15);
    dqzt(2);
});		     
</script>
</body>
</html>
