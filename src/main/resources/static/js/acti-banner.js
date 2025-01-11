$(function(){
	var index = 0;
	var imgWidth = $('.pics_switch .pic_box').width();//单张图片宽度
	//alert(imgWidth);
	var len = $('.pics_switch .pic_box').length;//图片数
	//alert(len)
	var totalImgWidth = imgWidth*len;//图片序列宽度
	//默认banne宽度是1600，低于1600的分辨率会出现位置偏差，需要调整，故在低于1600下设置banner宽度为100%；
	if($(window).width()<imgWidth) {
		$('.ps_box .pics_switch').css({'width':$(window).width()});
		$('.ps_box .pics_switch .pic_box').css({'width':$(window).width()});
		$('.ps_box .pics_switch .pic_box a').css({'width':$(window).width()});
		imgWidth = $(window).width();
	}
	//左右翻页按钮滑过透明度
	$('.ps_box .pics_switch .viewArrows').css({'opacity':0.4});
	$('.ps_box .pics_switch .viewArrows').hover(function() {
			$(this).fadeTo(200, 0.8);
		},function() {
			$(this).fadeTo(200, 0.4);
		}
	);
	//上一页按钮
	$(".ps_box .prev").click(function() {
		index -= 1;
		if(index == -1) {index = len - 1;}
		showPics(index);
	});
	
	//下一页按钮
	$(".ps_box .next").click(function() {
		index += 1;
		if(index == len) {index = 0;}
		showPics(index);
	});
	
	$('.ps_box .pb').css({'width':totalImgWidth});
	//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
	/*$('.ps_box .pb').hover(function() {
		clearInterval(picTimer);
	},function() {
		picTimer = setInterval(function() {
			showPics(index);
			index++;
			if(index == len) {index = 0;}
		},6000); //此4000代表自动播放的间隔，单位：毫秒
	}).trigger("mouseleave");*/
	
	//显示图片函数，根据接收的index值显示相应的内容
	function showPics(index) {
		var nowLeft = -index*imgWidth; //根据index值计算ul元素的left值
		$('.ps_box .pb').stop(true,false).animate({"marginLeft":nowLeft},1000,'easeInOutExpo'); //通过animate()调整ul元素滚动到计算出的position
	}
	
});