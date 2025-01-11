<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/public.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<link rel="stylesheet" href="${ctx}/static/css/index.css" type="text/css" />
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- END引用头部公共部分 -->
<!--about start-->
<div class="ab_all">
  <div class="ab_menu">
    <div class="center">
      <ul>
        <li id="aboutower"><a href="javascript:void(0);" class="li1">&nbsp;</a></li><!-- 关于我们 -->
        <li id="manageTeam"><a href="javascript:void(0);" class="li2">&nbsp;</a></li><!-- 团队风采 -->
        <li id="teamwork"><a href="javascript:void(0);" class="li3">&nbsp;</a></li><!--合作伙伴 -->
        <li id="mediaReport"><a href="javascript:void(0);" class="li4">&nbsp;</a></li><!-- 媒体报道-->
        <li id="performance"><a href="javascript:void(0);" class="li10">&nbsp;</a></li><!-- 业绩报告-->
        <li id="Qualification"><a href="javascript:void(0);" class="li5">&nbsp;</a></li><!-- 资质证件 -->
        <li id="siteNotice"><a href="javascript:void(0);" class="li6">&nbsp;</a></li><!-- 网站公告 -->
        <li id="invite"><a href="javascript:void(0);" class="li7">&nbsp;</a></li><!-- 招贤纳士 -->
        <li id="touchus"><a href="javascript:void(0);" class="li8">&nbsp;</a></li><!--联系我们 -->
        <li id="lawPolicy"><a href="javascript:void(0);" class="li9">&nbsp;</a></li><!-- 政策法规 -->
      </ul>
    </div>
  </div>
 
  <div id="showcontent" >
	<div class="ab_center">
		<div class="ab_content">${paramMap.content}</div>
	</div>
  </div>
</div>
<!--about end--> 
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
$(function(){
	//样式选中 
    var t = ${t};
    var id = ${id};
 	if(t==7){
 	 	if(id > -1){
			query(id);
 	 	}else if(id==-1){
 			queryNoticeListInfo();	
 	 	}
 	}else if(t==9){
 		qureryTouchus();//联系我们
 	}else if(t==11){
 		if(id>-1){
 			mediaDetail(id);
 		}
 		else{ 		
 			param["pageBean.pageNum"] = 1;
			queryMtbd(param);//媒体报到
		}		
 	}else if(t==10){
 		queryLawPolicy();//法律政策
 	}else if(${typeId==35 || typeId==36 || typeId==37}){
 	 	
 	}else {
		dqzt(0);
		queryAboutower();//公司简介
	}

	//联系我们 
	$("#touchus").click(function(){
		qureryTouchus();
	});
	
	//法律政策 
	$("#lawPolicy").click(function(){
		queryLawPolicy();
	});

	//公司简介
	$("#aboutower").click(function(){	
		queryAboutower();	
	});

	//资质证件
	$("#Qualification").click(function(){
		$.post("queryMessageDetail.do","typeId=20",function(data){
	         $("#showcontent").html("");
	         //$("#showcontent").html(data);
	         $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"
			        +"<a href='getMessageBytypeId.do?typeId=4''>"+data.columName+"</a>"+
	                       "<p class='zw'>"+data.content+"</p></div></div></div>");
	    });
	});
	
	//资费说明
	$("#costdesc").click(function(){
	    $.post("queryMessageDetail.do","typeId=6",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"
	    	         +"<h3>"+data.columName+"</h3>"+
	                           "<p class='zw'>"+data.content+"</p></div></div></div>");
	    });
	});
	
	//招贤纳士
	$("#invite").click(function(){
	    $.post("queryMessageDetail.do","typeId=10",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"
	    	         +"<a>"+data.columName+"</a>"+
                        "<p class='zw'>"+data.content+"</p></div><iframe width='100%' style='border:none; height:1020px; overflow:hidden;' src='jobs.html'></iframe></div></div>");
	    });
	});
	
	//合作伙伴
	$("#teamwork").click(function(){
	    $.post("queryMessageDetail.do","typeId=11",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"
	    	         +"<a>"+data.columName+"</a>"+
	                           "<p class='zw'>"+data.content+"</p></div></div></div>");
	    });
	});
	
	//友情链接
	$("#links").click(function(){
	    $.post("frontQueryMediaReportdList.do","",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html(data);
	    });
	});
	
	//媒体报道
	$("#mediaReport").click(function(){
		  param["pageBean.pageNum"] = 1;
		  queryMtbd(param);
	});

	//管理团队(团队风采)
	$("#manageTeam").click(function(){
		 $.post("frontTeam.do","",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html(data);
	        // $(".C_wz").eq(1).html("管理团队");
	    });
	});

	//专家顾问
	$("#expertAdvisor").click(function(){
		 $.post("frontTeam.do","state=3",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html(data);
	         $(".C_wz a").eq(1).html("专家顾问");
	    });
	});

	//网站公告
	$("#siteNotice").click(function(){
		queryNoticeListInfo();
	});

	//最新动态
	$("#recentNews").click(function(){
		 initNewsListInfo(null);
	});
});

function queryAboutower(){//公司简介
    $.post("queryMessageDetail.do","typeId=4",function(data){
         $("#showcontent").html("");
         //$("#showcontent").html(data);
         $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"
		        +"<a href='getMessageBytypeId.do?typeId=4''>"+data.columName+"</a>"+
                       "<p class='zw'>"+data.content+"</p></div></div></div>");
    });
}

function qureryTouchus(){//联系我们
    $.post("queryMessageDetail.do","typeId=7",function(data){
         $("#showcontent").html("");
         $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"
		         +"<a>"+data.columName+"</a>"+
                       "<p class='zw'>"+data.content+"</p></div></div></div>");
    });
}

function queryLawPolicy(){//法律政策
    $.post("queryMessageDetail.do","typeId=5",function(data){
         $("#showcontent").html("");
         $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"
		         +"<a>"+data.columName+"</a>"+
                       "<p class='zw'>"+data.content+"</p></div></div></div>");
    });
}

function doMtbdJumpPage(i){
	if(isNaN(i)){
		alert("输入格式不正确!");
		return;
	}
	$("#pageNum").val(i);
	param["pageBean.pageNum"]=i;
	//回调页面方法
	queryMtbd(param);
}

	//媒体
function queryMtbd(parDate){
	 $.post("queryMediaReportListPage.do",parDate,function(data){
         $("#showcontent").html("");
         $("#showcontent").html(data);
    });
}

	//网站公告
function queryNoticeListInfo(){	
	param["pageBean.pageNum"] = 1;	
	queryNewsListInit(param);
}
	//网站公告查询消息列表初始化
function queryNewsListInit(praData){		
	$.shovePost("queryNewsListPage.do",praData,function(data){
		$("#showcontent").html("");
       	$("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"+data+"</div></div></div>");
	});
}

	//动态
function initNewsListInfo(praData){		
	$.shovePost("frontQueryNewsList.do",praData,function(data){
		$("#showcontent").html("");
         $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"+data+"</div></div></div>");
	});
}
</script>
<script type="text/javascript">
//媒体报道
function mediaDetail(param){  
   $.post("frontMediaReportDetails.do","id="+param,function(data){
		$("#showcontent").html("");
		$("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"
               +"<h3>"+data.title+"</h3>"+"<p class='time'></p>"+
                    "<p class='zw'>"+data.content+"</p></div></div></div>");
   });
}
</script>
<script>
//业绩报告
$("#performance").click(function(){
	var result="";
	$.ajax({
		async:false,
		url : "html/performance.html",
		success : function(result){
	  	$("#showcontent").html("");
	  	$("#showcontent").html(result);
		}
	}); 
});
</script>
<script>
//公告详情
function query(id) {
	$.shovePost("frontNewsDetails.do","id="+id,function(data){
		$("#showcontent").html("");
      	$("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"+data+"</div></div></div>");
	});
}

//公告详情中的上一页
function queryUp(id){
	$.shovePost("frontNewsDetails.do","id="+id,function(data){
		$("#showcontent").html("");
      	$("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"+data+"</div></div></div>");
	});
}

//公告详情中的下一页
function queryDown(id){
	$.shovePost("frontNewsDetails.do","id="+id,function(data){
		$("#showcontent").html("");
      	$("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"+data+"</div></div></div>");
	});
}
</script>
</body>
</html>
