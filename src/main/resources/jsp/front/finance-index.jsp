<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="refresh" content="300" />
<jsp:include page="../include/head.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/filter.js"></script><!--筛选器 js-->
<script type="text/javascript" src="${ctx}/static/js/public.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/js/round.js"></script><!--百分比 js-->

<script>
$(function() {
	var param = {};
	$.post("financeBorrowByCondition.do?je=1&qx=6&t=news1",param,function(data){
		$("#content").html("");
		$("#content").html(data);
	});
});
//债权金额
function check(id){
	var url="";
	var typeId=$("#title a[class='on']").attr("id");//获取被选中的债权方式
	if(typeId!='news2'){//判断如果是债权转让不跳转
		if(id<=5){//点击债权金额
			//获取被选中的债权期限
		   	var mon=RetSelecteds().split("\n");
		   	var	month=mon.slice(1,2);
		   	if(month==""){//判断再次点击该按钮
				month=mon.slice(0,1);
			}
			url="?je="+id+"&qx="+month+"&t="+typeId;
		}else if(id>5&&id<12){//点击债权期限
			var money=RetSelecteds().split("\n").slice(0,1);//获取被选中的债权金额
			url="?je="+money+"&qx="+id+"&t="+typeId;
		}
	   	queryBorrow(url);
	}
}

//查询投资项目筛选后的内容
function queryBorrow(url){
	var param = {};
	$.post("financeBorrowByCondition.do"+url,param,function(data){
		$("#content").html("");
		$("#content").html(data);
	});
}

function initListInfo(param){
	var typeId=$("#title a[class='on']").attr("id");//获取被选中的债权方式
	var m =RetSelecteds().split("\n");
	var money=m.slice(0,1);
	var month=m.slice(1, 2)
	if (m == "") {
		money = '1';
		month = '6';
	}
	var url="?je="+money+"&qx="+month+"&t="+typeId;
	$.post("financeBorrowByCondition.do"+url,param,function(data){
		$("#content").html("");
		$("#content").html(data);
	});
}

function deleteCookie(name){
    var date=new Date();
    date.setTime(date.getTime()-10000);
    document.cookie=name+"=v; expire="+date.toGMTString();
}
</script>	
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- 引用头部公共部分End -->
<!--invest start-->
<div class="invest">
  <div class="center"> 
    <!--筛选器 start-->
    <div class="in_choose">
      <div class="in_choose_top">投资项目筛选</div>
      <div class="in_choose_content" id="filter">
       <div>
        <dl>
          <dt>债权金额：</dt>
          <dd><div><a id="1"  onclick="javascript:check('1')" href="javascript:void(0);">全部</a></div></dd>
          <dd><div><a id="2" onclick="javascript:check('2')" href="javascript:void(0);">2万以下</a></div></dd>
          <dd><div><a id="3" onclick="javascript:check('3')" href="javascript:void(0);">2万-5万</a></div></dd>
          <dd><div><a id="4" onclick="javascript:check('4')" href="javascript:void(0);">5万-10万</a></div></dd>
          <dd><div><a id="5" onclick="javascript:check('5')" href="javascript:void(0);">10万以上</a></div></dd>
        </dl>
       </div>
       <div>
        <dl>
          <dt>债权期限：</dt>
          <dd><div><a id="6" onclick="javascript:return check('6')" href="javascript:void(0);">全部</a></div></dd>
          <dd><div><a id="7" onclick="javascript:return check('7')" href="javascript:void(0);">3个月</a></div></dd>
          <dd><div><a id="8" onclick="javascript:return check('8')" href="javascript:void(0);">6个月</a></div></dd>
          <dd><div><a id="9" onclick="javascript:return check('9')" href="javascript:void(0);">9个月</a></div></dd>
          <dd><div><a id="10" onclick="javascript:return check('10')" href="javascript:void(0);">12个月</a></div></dd>
          <dd><div><a id="11" onclick="javascript:return check('11')" href="javascript:void(0);">12个月以上</a></div></dd>
        </dl>
      </div>
      </div>
    </div>
    <!--筛选器end--> 
    <div id="tabs">
	    <div class="title" id="title">
			<a href="javascript:void(0);" id="news1" onclick="showNewsBox('news1')" class="on">所有借款</a>
			<a href="javascript:void(0);" id="news2" onclick="showNewsBox('news2')">债权转让标</a>
			<a href="javascript:void(0);" id="news3" onclick="showNewsBox('news3')">净值借款标</a>
			<a href="javascript:void(0);" id="news4" onclick="showNewsBox('news4')">信用借款标</a>
			<a href="javascript:void(0);" id="news5" onclick="showNewsBox('news5')">实地借款标</a>
			<a href="javascript:void(0);" id="news6" onclick="showNewsBox('news6')">担保借款标</a>
			<%-- 目前未设置  使用之后 还需修改 tab.js 
			<a href="javascript:void(0);" id="news7" onclick="showNewsBox('news7')">抵押借款标</a>
			<a href="javascript:void(0);" id="news8" onclick="showNewsBox('news8')">机构合作标</a>
			--%>
		</div>
		<div class="noun" id="xx1" style="display:block;"> 
			<img src="${ctx}/static/images/in_pic.jpg" />
		    <p>
		       <span>全部借款标：（All borrowing）</span><br />
		               净值借款、信用借款、实地借款和担保借款标的信息。
		    </p>
		</div>
		<div class="noun" id="xx2" style="display: none;"> 
			<img src="${ctx}/static/images/in_zr.jpg" />
			<p>
				<span>债权转让标：（CreditAssignment）</span><br />
				通过债权转让提高投资的流动性，增强用户体验。在您需要流动资金时，可以通过出售名下拥有的符合相应条件的债权给其他投资人，从而完成债权转让，获得流动资金。债权总额大于500元，并且持有60天后即可进行转让。
			</p>
		</div>
		<div class="noun" id="xx3" style="display: none;"> 
			<img src="${ctx}/static/images/in_jz.jpg" />
            <p>
				<span>净值借款标：（Net borrowing）</span><br />
           		通过账户的净资产抵押进行借款，用于临时周转或再投资，提高资金利用效率。
            </p>
		</div>
         <div class="noun" id="xx4" style="display: none;"> 
			<img src="${ctx}/static/images/in_xy.jpg" />
			<p>
				<span>信用借款标（Debt of honour）</span><br />
         		通过对借款用户的个人信用资质进行全面审核后，允许用户发布的借款标。
			</p>
		</div>
		<div class="noun" id="xx5" style="display: none;"> 
			<img src="${ctx}/static/images/in_sd.jpg" />
            <p>
				<span>实地借款标（Field borrowing）</span><br />
           		通过对借款人情况进行实地走访、审核调查以及后续的贷中、贷后服务环节，加强风险管理控制，进一步保障了理财用户资金安全，使得您理财更加省心、放心。
            </p>
		</div>
        <div class="noun" id="xx6" style="display: none;"> 
			<img src="${ctx}/static/images/in_db.jpg" />
			<p>
				<span>担保借款标（Loan guarantee）</span><br />
        		 通过担保合作伙伴为相应的借款承担连带保证责任的借款标的。风控管理进行双重审核，严控风险。此外，一旦合作伙伴违背其应承担的连带保证责任，根据合作协议好乐易贷有权通过法律手段进行追偿。
			</p>
		</div>  
		<!--tab start-->
		<div id="content" class="tabcontent"></div>
		<!--tab end--> 
	</div>
  </div>
</div>
<div class="clear"></div>
<!--invest end--> 
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 引用底部公共部分End -->
<script type="text/javascript" src="${ctx}/static/js/xl.js"></script>
<script type="text/javascript" src="${ctx}/static/js/tab.js"></script><!--选项卡 js-->
<script type="text/javascript" src="${ctx}/static/js/raphael-min.js"></script> <!--百分比 js-->

</body>
</html>