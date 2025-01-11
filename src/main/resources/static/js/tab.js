// JavaScript Document
function showNewsBox(id){
	if(id=='news2'){//债权转让
		for(var i=1;i<7;i++){
			if(id=='news'+i){
				$("#news"+i).attr("class","on");
				$("#xx"+i).attr("style","display:block;");
			}
			else{
				$("#news"+i).attr("class","");
				$("#xx"+i).attr("style","display:none");
			}
		}
		$.post("financeDebtInit.do", function(data) {
			$("#content").html("");
			$("#content").html(data);
		});
	}else{//其他借款方式
    var url="";
    var param = {};
	var m=RetSelecteds().split("\n");
	var money=m.slice(0, 1);//获取被选中的债权金额
	var month=m.slice(1, 2);//后去被选中的债权期限
		url="?je="+money+"&qx="+month+"&t="+id;
		$.post("financeBorrowByCondition.do"+url,param,function(data){
			for(var i=1;i<7;i++){
				if(id=='news'+i){
					$("#news"+i).attr("class","on");
					$("#xx"+i).attr("style","display:block;");
				}
				else{
					$("#news"+i).attr("class","");
					$("#xx"+i).attr("style","display:none");
				}
			}
			$("#content").html("");
			$("#content").html(data);
		});
	}

}
function getUrl(){
	var result="";
	$("#title a[class='on']").each(function(){
		 result += $(this).attr("id")+"\n";
	});
	return result;
}
 
function showNewsBox1(id){
    var objDt=document.getElementById("tabs1").getElementsByTagName("a");
   //var objDD=document.getElementById("news").getElementsByClassName("tabcontent");
    if(id =='news1'){
	    var id = $('#idStr').val();
		param['paramMap.id'] = id;
		$.post('financeInvestRecord.do', param, function(data) {
			$('#info_repayment').html("");
			$('#info_invest').html("");
			$('#info_invest').html(data);
			document.getElementById('news1').className='on';
			document.getElementById('news2').className='';
		});
	}
    if(id =='news2'){
    	var id = $('#idStr').val();
		param['paramMap.id'] = id;
		$.post('financeRepay.do', param, function(data) {
			$('#info_invest').html("");
			$('#info_repayment').html("");
			$('#info_repayment').html(data);
			document.getElementById('news2').className='on';
			document.getElementById('news1').className='';
		});
	}
}
function showNewsBox2(id){//个人账户》通知设置的tab
    var objDt=document.getElementById("acc_tabs").getElementsByTagName("a");
   //var objDD=document.getElementById("news").getElementsByClassName("tabcontent");
    for(var i=0;i<3;i++){
	    document.getElementById("tab"+[i]).style.display="none";
	}
    for(var i=0;i<objDt.length;i++){
      objDt[i].className="";
      if(objDt[i].id==id){
		try{
			document.getElementById("tab"+[i]).style.display="";
			objDt[i].style.color='#FFF';
			objDt[i].style.background='#35c2cb';
		}catch(e){
			alert("缺少内容标签");
		 }
	  }else{
		  objDt[i].style.background='';
		  objDt[i].style.color='#475058';
	  }
   }
 }
 function showNewsBox3(id){//个人账户》充值提现下的tab
    var objDt=document.getElementById("acc_tabs").getElementsByTagName("a");
   //var objDD=document.getElementById("news").getElementsByClassName("tabcontent");
    for(var i=0;i<2;i++){
	    document.getElementById("tab"+[i]).style.display="none";
	}
    for(var i=0;i<objDt.length;i++){
      objDt[i].className="";
      if(objDt[i].id==id){
		try{
			document.getElementById("tab"+[i]).style.display="";
			objDt[i].style.color='#FFF';
			objDt[i].style.background='#35c2cb';
			
		}catch(e){
			alert("缺少内容标签");
		 }
	  }else{
		  objDt[i].style.background='';
		  objDt[i].style.color='#475058';
	  }
   }
}
