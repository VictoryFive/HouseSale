<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Angling Booking Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<script type="application/x-javascript">
	
	
	
	
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);
		function hideURLbar() {
			window.scrollTo(0, 1);
		}


</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/jquery-ui-publish.css" />
<link
	href="${pageContext.request.contextPath}/static/css/style-publish.css"
	rel='stylesheet' type='text/css' media="all">
<link href="//fonts.googleapis.com/css?family=Cuprum:400,700"
	rel="stylesheet">
<title>出售房产</title>
</head>
<body>
	<h1 class="header-w3ls">出 售 房 屋</h1>
	<div class="appointment-w3">
		<form action="${pageContext.request.contextPath}/saleHouse"
			method="post" enctype="multipart/form-data">
			<div class="main">
				<div class="form-left-w3l">
					<input type="text" class="top-up" name="house_name"
						placeholder="请输入小区名" required="required" />
				</div>
				<div class="form-right-w3ls ">
					<input type="text" class="top-up" id="house_province"
						name="house_province" placeholder="所在省份" required="required" />
					<!-- <select class="form-control" name="house_province" id = 
						required="required">
						<option value="none">所在省份</option>
						<option value="山东">山东省</option>
						<option value="江苏">江苏省</option>
						<option value="上海">上海市</option>
						<option value="浙江">浙江省</option>
						<option value="安徽">安徽省</option>
						<option value="福建">福建省</option>
						<option value="江西">江西省</option>
						<option value="广东">广东省</option>
						<option value="广西">广西省</option>
						<option value="海南">海南省</option>
						<option value="河南">河南省</option>
						<option value="湖南">湖南省</option>
						<option value="湖北">湖北省</option>
						<option value="河北">河北省</option>
						<option value="北京">北京市</option>
						<option value="天津">天津市</option>
						<option value="河北">河北省</option>
						<option value="内蒙古">内蒙古</option>
						<option value="宁夏">宁夏省</option>
						<option value="青海">青海省</option>
						<option value="陕西">陕西省</option>
						<option value="甘肃">甘肃省</option>
						<option value="新疆">新疆省</option>
						<option value="四川">四川省</option>
						<option value="贵州">贵州省</option>
						<option value="云南">云南省</option>
						<option value="重庆">重庆市</option>
						<option value="西藏">西藏省</option>
						<option value="辽宁">辽宁省</option>
						<option value="吉林">吉林省</option>
						<option value="黑龙江">黑龙江</option>
						<option value="香港">香港</option>
						<option value="澳门">澳门</option>
						<option value="台湾">台湾</option>
					</select> -->
					<!-- <div class="clearfix" ></div> -->
				</div>
			</div>
			<div class="main">
				<div class="form-left-w3l">
					<input type="text" id="house_city" name="house_city"
						placeholder="所在城市" required="required" />
				</div>
				<div class="form-right-w3ls ">
					<input class="buttom" type="text" id="house_distric"
						name="house_distric" placeholder="所在的区" required="required" />
					<!-- <div class="clearfix"></div> -->
				</div>
			</div>
			<div class="main">
				<div class="form-left-w3l">
					<select class="form-control" name="house_design"
						required="required">
						<option value="高铁沿线">房 屋 附 近 设 施</option>
						<option value="高铁沿线">高 铁 沿 线</option>
						<option value="地处海滨">地 处 海 滨</option>
						<option value="地段繁华">地 段 繁 华</option>
						<option value="中心商业区">中 心 商 业 区</option>
						<option value="依山傍水">依 山 傍 水</option>
					</select>
				</div>
				<div class="form-right-w3ls ">
					<input type="text" name="house_RB" readonly="readonly" value="二手"
						required="required" />
				</div>
			</div>
			<div class="main">
				<div class="form-left-w3l">
					<input type="text" name="house_money" placeholder="房屋总价(单元：万)"
						required="required" />
					<div class="clearfix"></div>

				</div>
				<div class="form-right-w3ls ">
					<input type="text" name="house_area" placeholder="房屋面积(单位：平)"
						required="required" />
				</div>
			</div>
			<div class="main">
				<div class="form-left-w3l">
					<select class="form-control" name="house_type">
						<option value="1室1厅">房 屋 格 局</option>
						<option value="1室1厅">1 室 1 厅</option>
						<option value="2室1厅">2 室 1 厅</option>
						<option value="3室1厅">3 室 1 厅</option>
						<option value="4室1厅">4 室 1 厅</option>
						<option value="1室2厅">1 室 2 厅</option>
						<option value="2室2厅">2 室 2 厅</option>
						<option value="3室2厅">3 室 2 厅</option>
						<option value="4室2厅">4 室 2 厅</option>
					</select>
				</div>
				<div class="form-left-w3l">
					<input class="buttom" type="file" name="house_url"
						placeholder="上传您房屋的照片" required="required" />
					<!-- <div class="clearfix"></div> -->
				</div>

			</div>
			<div class="form-control-w3l">
				<textarea name="house_info" placeholder="房屋描述..."></textarea>
			</div>
			<div class="form-left-w3l">
				<input type="hidden" name="h_x" id="h_x" />
			</div>
			<div class="form-left-w3l">
				<input type="hidden" name="h_y" id="h_y" />
			</div>
			<div class="form-control-w3l" id='allmap'
				style='opacity: 0.6; width: 650px; height: 225px; display: block'></div>

			<div class="btnn">
				<input type="submit" value="发   布">
			</div>
			<br /> <br />
			<p>
				<a style="color: white;"
					href="${pageContext.request.contextPath}/index.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					style="color: white;"
					href="${pageContext.request.contextPath}/jsp/rentHouse.jsp">我要出租</a>
			</p>
		</form>
	</div>
	<div class="copy">
		<p>&copy; 2018 B&RINDEX.COM All Rights Reserved</p>
	</div>
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=v7ugaj8evae4hfLSRrlxn6cRAYIMixt2"></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath}/static/js/jquery-2.2.3.min-publish.js'></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery-ui-publish.js"></script>
	<script>
		$(function() {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3")
					.datepicker();
		});
		//

		var map = new BMap.Map("allmap");
		var geoc = new BMap.Geocoder(); //地址解析对象  
		var markersArray = [];
		var geolocation = new BMap.Geolocation();

		var dd = "12.3423435";

		var point = new BMap.Point(116.331398, 39.897445);
		map.centerAndZoom(point, 12); // 中心点  

		//获取当前位置
		geolocation.getCurrentPosition(function(r) {
			if (this.getStatus() == BMAP_STATUS_SUCCESS) {
				var mk = new BMap.Marker(r.point);
				//map.addOverlay(mk);  
				map.panTo(r.point);
				map.enableScrollWheelZoom(true);
			} else {
				alert('failed' + this.getStatus());
			}
		}, {
			enableHighAccuracy : true
		})

		map.addEventListener("click", showInfo);

		//清除标识  
		function clearOverlays() {
			if (markersArray) {
				for (i in markersArray) {
					map.removeOverlay(markersArray[i])
				}
			}
		}
		//地图上标注  
		function addMarker(point) {
			var marker = new BMap.Marker(point);
			markersArray.push(marker);
			clearOverlays();
			map.addOverlay(marker);
		}
		//点击地图时间处理  
		function showInfo(e) {
			document.getElementById('h_x').value = e.point.lng;
			document.getElementById('h_y').value = e.point.lat;
			geoc
					.getLocation(
							e.point,
							function(rs) {
								var addComp = rs.addressComponents;
								var address = addComp.province + addComp.city
										+ addComp.district;
								if (confirm("确定要地址是" + address + "?")) {
									document.getElementById("house_distric").value = addComp.district;
									document.getElementById("house_province").value = addComp.province;
									document.getElementById("house_city").value = addComp.city;
								}
							});
			addMarker(e.point);
		}
	</script>
</body>
</html>