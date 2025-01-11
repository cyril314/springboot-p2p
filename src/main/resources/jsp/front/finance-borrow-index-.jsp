<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>

<div id="tabs">
	<div id="tab0" class="tabcontent">
		<div id="tab1" class="tabcontent" style="display: none">债权转让</div>
		<div id="tab2" class="tabcontent" style="display: none">净值借款</div>
		<div id="tab3" class="tabcontent" style="display: none">信用借款</div>
		<div id="tab4" class="tabcontent" style="display: none">实地借款</div>
		<div id="tab5" class="tabcontent" style="display: none">担保借款</div>
		<div id="tab6" class="tabcontent" style="display: none">抵押借款</div>
		<div id="tab7" class="tabcontent" style="display: none">机构合作</div>
		<div class="noun">
			<img src="{ctx}/static/images/in_pic.jpg" />
			<p>
				<span>债权转让（CreditAssignmen）</span><br />
				债权转让又称“债权让与”，是指在不改变合同内容的合同转让，债权人通过债权转让第三人订立合同将债权的全部或部分转移于第三人。债权全部让与第三人，第三人取代原债权人成为原合同关系的新的债权人，原合同债权人因合同转让而丧失合同债权人权利，债权部分让与第三人，第三人成为合同债权人加入到原合同关系之中，成为新的债权人，合同中的债权关系由...【
				<a href="javascript:void(0);">查看详细</a>】
			</p>
		</div>
			<!--分页器 开始-->
			<div class="digg clear">
				<span id="showList"></span>
			</div>
			<!--分页器 结束-->
		</div>
	</div>
<script type="text/javascript">
$(function(){
	var param = {};
	initListInfo(param);
});
function initListInfo(param) {
	$.post("financeBorrowByCondition.do", param, function(data) {
		$("#showList").html(data);
	});
};
</script>