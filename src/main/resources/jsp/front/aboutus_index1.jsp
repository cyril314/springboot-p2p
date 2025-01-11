<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<jsp:include page="../include/head.jsp"></jsp:include>
    
</head>

<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="C_content1">
  <div class="C_content  C_content2  layout" style="  "">
    <div class="C_left_bt">
    <!--  <h3>关于我们</h3> -->
    <h2><img src="{ctx}/static/images/C_gywm.png" /></h2>
    	<ul style="fon">
		     <li id="aboutower"><a href="javascript:void(0);" style="color:#fff;">公司简介</a></li>
		     <li id="manageTeam"><a href="javascript:void(0);" style="color:#fff;">管理团队</a></li>
		  	 <li id="expertAdvisor"><a href="javascript:void(0);" style="color:#fff;">专家顾问</a></li>
		     <li id="teamwork"><a  href="javascript:void(0);" style="color:#fff;">合作伙伴</a></li>
		     <li id="mediaReport"><a href="javascript:void(0);" style="color:#fff;">媒体报道</a></li>
		    <!--   <li id="recentNews"><a href="javascript:void(0);" style="color:#fff;">最新动态</a></li> -->
		     <li id="siteNotice"><a href="javascript:void(0);" style="color:#fff;">网站公告</a></li>
		     <li id="invite"><a href="javascript:void(0);" style="color:#fff;">招贤纳士</a></li>
		     <li id="touchus"><a href="javascript:void(0);" style="color:#fff;">联系我们</a></li>
		     <li id="lawPolicy"><a href="javascript:void(0);" style="color:#fff;">法律政策</a></li>
		      
		     <!--  
		   	 <li id="touchus"><a  href="javascript:void(0);" >联系我们</a></li>
		     <li id="costdesc"><a href="javascript:void(0);" >资费说明</a></li> 
		     <li class="last" id="links"  ><a href="javascript:void(0);">友情链接</a></li>
		     -->
    	</ul>
    </div>
    <div id="showcontent" class="rightbox">
       <div class='C_right_bt'>
	       <div class='C_wz'><a href="getMessageBytypeId.do?typeId=4">关于我们</a> >
		       <a>${paramMap.columName }</a></div><div class='C_nr_jj'>
		       <p class='zw'>${paramMap.content }</p>
	       </div>
       </div>
      <!-- 内容显示位置 -->
    </div>
 </div>
</div>
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
			$('#siteNotice').addClass('C_current1');
			$('#manageTeam').removeClass('C_current1');
			$('#invite').removeClass('C_current1');
			$('#costdesc').removeClass('C_current1');
			$('#mediaReport').removeClass('C_current1');
			$('#teamwork').removeClass('C_current1');
			$('#links').removeClass('C_current1');
			$('#touchus').removeClass('C_current1');
			$('#aboutower').removeClass('C_current1');
			$('#recentNews').removeClass('C_current1');
			$('#expertAdvisor').removeClass('C_current1');
			query(id);
 	 	}else if(id==-1){
 	 		$('#siteNotice').addClass('C_current1');
 			$('#manageTeam').removeClass('C_current1');
 			$('#invite').removeClass('C_current1');
 			$('#costdesc').removeClass('C_current1');
 			$('#mediaReport').removeClass('C_current1');
 			$('#teamwork').removeClass('C_current1');
 			$('#links').removeClass('C_current1');
 			$('#touchus').removeClass('C_current1');
 			$('#aboutower').removeClass('C_current1');
 			$('#recentNews').removeClass('C_current1');
 			$('#expertAdvisor').removeClass('C_current1');
 			queryNoticeListInfo();	
 	 	}
 	}else if(t==9){
 		qureryTouchus();//联系我们
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
	
	
		//资费说明
	$("#costdesc").click(function(){
		 $('#costdesc').addClass('C_current1');
			$('#invite').removeClass('C_current1');
			$('#teamwork').removeClass('C_current1');
			$('#links').removeClass('C_current1');
			$('#mediaReport').removeClass('C_current1');
			 $('#touchus').removeClass('C_current1');
			 $('#aboutower').removeClass('C_current1');
			 $('#manageTeam').removeClass('C_current1');
			 $('#siteNotice').removeClass('C_current1');
			 $('#recentNews').removeClass('C_current1');
			 $('#expertAdvisor').removeClass('C_current1');
			 $('#lawPolicy').removeClass('C_current1');
	    $.post("queryMessageDetail.do","typeId=6",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html("<h3>"+data.columName+"</h3>"+
	                           "<p class='zw'>"+data.content+"</p>");
	    });
	});
	
	
		//招贤纳士
	$("#invite").click(function(){
		 $('#invite').addClass('C_current1');
		 $('#costdesc').removeClass('C_current1');
		 $('#teamwork').removeClass('C_current1');
		 $('#links').removeClass('C_current1');
		 $('#mediaReport').removeClass('C_current1');
		 $('#touchus').removeClass('C_current1');
		 $('#aboutower').removeClass('C_current1');
		 $('#manageTeam').removeClass('C_current1');
		 $('#siteNotice').removeClass('C_current1');
		 $('#recentNews').removeClass('C_current1');
		 $('#expertAdvisor').removeClass('C_current1');
		 $('#lawPolicy').removeClass('C_current1');
	    $.post("queryMessageDetail.do","typeId=10",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html("<div class='C_right_bt'><div class='C_wz'><a href='getMessageBytypeId.do?typeId=4'>关于我们</a> > " +
		    	        "<a>"+data.columName+"</a></div><div class='C_nr_jj'>"+
                        "<p class='zw'>"+data.content+"</p></div></div>");
	    });
	});
	
			//合作伙伴
	$("#teamwork").click(function(){
		 $('#invite').removeClass('C_current1');
		 $('#costdesc').removeClass('C_current1');
		 $('#links').removeClass('C_current1');
		 $('#mediaReport').removeClass('C_current1');
		 $('#touchus').removeClass('C_current1');
		 $('#aboutower').removeClass('C_current1');
		 $('#manageTeam').removeClass('C_current1');
		 $('#siteNotice').removeClass('C_current1');
		 $('#recentNews').removeClass('C_current1');
		 $('#expertAdvisor').removeClass('C_current1');
		 $('#lawPolicy').removeClass('C_current1');
		 $('#teamwork').addClass('C_current1');
	    $.post("queryMessageDetail.do","typeId=11",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html("<div class='C_right_bt'><div class='C_wz'><a href='getMessageBytypeId.do?typeId=4'>关于我们</a> > " +
	    	        "<a>"+data.columName+"</a></div><div class='C_nr_jj' style='margin-top:20px;'>"+
	                           "<p class='zw'>"+data.content+"</p></div></div>");
	    });
	});
	
				//友情链接
	$("#links").click(function(){
		 $('#invite').removeClass('C_current1');
		 $('#costdesc').removeClass('C_current1');
		 $('#teamwork').removeClass('C_current1');
		 $('#mediaReport').removeClass('C_current1');
		 $('#touchus').removeClass('C_current1');
		 $('#aboutower').removeClass('C_current1');
		 $('#manageTeam').removeClass('C_current1');
		 $('#siteNotice').removeClass('C_current1');
		 $('#recentNews').removeClass('C_current1');
		 $('#expertAdvisor').removeClass('C_current1');
		 $('#lawPolicy').removeClass('C_current1');
		 $('#links').addClass('C_current1');
	    $.post("frontQueryMediaReportdList.do","",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html(data);
	    });
	});
	
					//媒体报道
	$("#mediaReport").click(function(){
		 $('#mediaReport').addClass('C_current1');
		 $('#invite').removeClass('C_current1');
		 $('#costdesc').removeClass('C_current1');
		 $('#teamwork').removeClass('C_current1');
		 $('#links').removeClass('C_current1');
		 $('#touchus').removeClass('C_current1');
		 $('#aboutower').removeClass('C_current1');
		 $('#manageTeam').removeClass('C_current1');
		 $('#siteNotice').removeClass('C_current1');
		 $('#recentNews').removeClass('C_current1');
		 $('#expertAdvisor').removeClass('C_current1');
		 $('#lawPolicy').removeClass('C_current1');
		  param["pageBean.pageNum"] = 1; 
		  queryMtbd(param);
	});
	

	//管理团队
	$("#manageTeam").click(function(){
		 $('#manageTeam').addClass('C_current1');
		 $('#invite').removeClass('C_current1');
		 $('#costdesc').removeClass('C_current1');
		 $('#mediaReport').removeClass('C_current1');
		 $('#teamwork').removeClass('C_current1');
		 $('#links').removeClass('C_current1');
		 $('#touchus').removeClass('C_current1');
		 $('#aboutower').removeClass('C_current1');
		 $('#siteNotice').removeClass('C_current1');
		 $('#recentNews').removeClass('C_current1');
		 $('#expertAdvisor').removeClass('C_current1');
		 $('#lawPolicy').removeClass('C_current1');
		 $.post("frontTeam.do","",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html(data);
	         $(".C_wz").eq(1).html("管理团队");
	    });
	});
	

	//专家顾问
	$("#expertAdvisor").click(function(){
		 $('#expertAdvisor').addClass('C_current1');
		 $('#manageTeam').removeClass('C_current1');
		 $('#invite').removeClass('C_current1');
		 $('#costdesc').removeClass('C_current1');
		 $('#mediaReport').removeClass('C_current1');
		 $('#teamwork').removeClass('C_current1');
		 $('#links').removeClass('C_current1');
		 $('#touchus').removeClass('C_current1');
		 $('#aboutower').removeClass('C_current1');
		 $('#siteNotice').removeClass('C_current1');
		 $('#recentNews').removeClass('C_current1');
		 $('#lawPolicy').removeClass('C_current1');
		 $.post("frontTeam.do","state=3",function(data){
	         $("#showcontent").html("");
	         $("#showcontent").html(data);
	         $(".C_wz a").eq(1).html("专家顾问");
	    });
	});

	

	//网站公告
	$("#siteNotice").click(function(){
		$('#siteNotice').addClass('C_current1');
		 $('#manageTeam').removeClass('C_current1');
		 $('#invite').removeClass('C_current1');
		 $('#costdesc').removeClass('C_current1');
		 $('#mediaReport').removeClass('C_current1');
		 $('#teamwork').removeClass('C_current1');
		 $('#links').removeClass('C_current1');
		 $('#touchus').removeClass('C_current1');
		 $('#aboutower').removeClass('C_current1');
		 $('#recentNews').removeClass('C_current1');
		 $('#expertAdvisor').removeClass('C_current1');
		 $('#lawPolicy').removeClass('C_current1');
		queryNoticeListInfo();
	});


	//最新动态
	$("#recentNews").click(function(){
		$('#recentNews').addClass('C_current1');
		$('#siteNotice').removeClass('C_current1');
		 $('#manageTeam').removeClass('C_current1');
		 $('#invite').removeClass('C_current1');
		 $('#costdesc').removeClass('C_current1');
		 $('#mediaReport').removeClass('C_current1');
		 $('#teamwork').removeClass('C_current1');
		 $('#links').removeClass('C_current1');
		 $('#touchus').removeClass('C_current1');
		 $('#aboutower').removeClass('C_current1');
		 $('#expertAdvisor').removeClass('C_current1');
		 $('#lawPolicy').removeClass('C_current1');
		 initNewsListInfo(null);
	});
});

	function queryAboutower(){//公司简介
		$('#aboutower').addClass('C_current1');
			$('#costdesc').removeClass('C_current1');
			$('#invite').removeClass('C_current1');
			$('#teamwork').removeClass('C_current1');
			$('#links').removeClass('C_current1');
			$('#mediaReport').removeClass('C_current1');
			 $('#touchus').removeClass('C_current1');
			 $('#aboutower').addClass('C_current1');
			 $('#manageTeam').removeClass('C_current1');
			 $('#siteNotice').removeClass('C_current1');
			 $('#recentNews').removeClass('C_current1');
			 $('#expertAdvisor').removeClass('C_current1');
			 $('#lawPolicy').removeClass('C_current1');
		    $.post("queryMessageDetail.do","typeId=4",function(data){
		         $("#showcontent").html("");
		         $("#showcontent").html("<div class='C_right_bt'><div class='C_wz'><a href='getMessageBytypeId.do?typeId=4'>关于我们</a> > " +
			    	        "<a href='getMessageBytypeId.do?typeId=4''>"+data.columName+"</a></div><div class='C_nr_jj'>"+
	                        "<p class='zw'>"+data.content+"</p></div></div>");
		    });
	}

	function qureryTouchus(){//联系我们
		$('#touchus').addClass('C_current1');
			$('#aboutower').removeClass('C_current1');
			$('#costdesc').removeClass('C_current1');
			$('#invite').removeClass('C_current1');
			$('#teamwork').removeClass('C_current1');
			$('#links').removeClass('C_current1');
			$('#mediaReport').removeClass('C_current1');
			$('#manageTeam').removeClass('C_current1');
			$('#siteNotice').removeClass('C_current1');
			$('#recentNews').removeClass('C_current1');
			$('#expertAdvisor').removeClass('C_current1');
			$('#lawPolicy').removeClass('C_current1');
		    $.post("queryMessageDetail.do","typeId=7",function(data){
		         $("#showcontent").html("");
		         $("#showcontent").html("<div class='C_right_bt'><div class='C_wz'><a href='getMessageBytypeId.do?typeId=4'>关于我们</a> > " +
			    	        "<a>"+data.columName+"</a></div><div class='C_nr_jj'>"+
	                        "<p class='zw'>"+data.content+"</p></div></div>");
		    });
	}


	function queryLawPolicy(){//法律政策
			$('#lawPolicy').addClass('C_current1');
			$('#touchus').removeClass('C_current1');
			$('#aboutower').removeClass('C_current1');
			$('#costdesc').removeClass('C_current1');
			$('#invite').removeClass('C_current1');
			$('#teamwork').removeClass('C_current1');
			$('#links').removeClass('C_current1');
			$('#mediaReport').removeClass('C_current1');
			$('#manageTeam').removeClass('C_current1');
			$('#siteNotice').removeClass('C_current1');
			$('#recentNews').removeClass('C_current1');
			$('#expertAdvisor').removeClass('C_current1');	
		    $.post("queryMessageDetail.do","typeId=5",function(data){
		         $("#showcontent").html("");
		         $("#showcontent").html("<div class='C_right_bt'><div class='C_wz'><a href='getMessageBytypeId.do?typeId=4'>关于我们</a> > " +
			    	        "<a>"+data.columName+"</a></div><div class='C_nr_jj'>"+
	                        "<p class='zw'>"+data.content+"</p></div></div>");
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

	//公告
	function queryNoticeListInfo(){	
		param["pageBean.pageNum"] = 1;	
		queryNewsListInit(param);
	}

	function queryNewsListInit(praData){		
		$.shovePost("queryNewsListPage.do",praData,function(data){
			$("#showcontent").html("");
        	$("#showcontent").html(data);
		});
	}
	

	//动态
	function initNewsListInfo(praData){		
		$.shovePost("frontQueryNewsList.do",praData,function(data){
			$("#showcontent").html("");
	         $("#showcontent").html(data);
		});
	}
</script>
<script type="text/javascript">
		
       function mediaDetail(param){  
          $.post("frontMediaReportDetails.do","id="+param,function(data){
                  $("#showcontent").html("");
              $("#showcontent").html("<h3>"+data.title+"</h3>"+
                             "<p class='time'></p>"+
                           "<p class='zw'>"+data.content+"</p>");
          });
       }
</script>

<script>
//公告详情
function query(id) {
	$.shovePost("frontNewsDetails.do","id="+id,function(data){
		$("#showcontent").html("");
      	$("#showcontent").html(data);
	});
}

//公告详情中的上一页
function queryUp(id){
	$.shovePost("frontNewsDetails.do","id="+id,function(data){
		$("#showcontent").html("");
      	$("#showcontent").html(data);
	});
}

//公告详情中的下一页
function queryDown(id){
	$.shovePost("frontNewsDetails.do","id="+id,function(data){
		$("#showcontent").html("");
      	$("#showcontent").html(data);
	});
}

</script>
</body>
</html>
