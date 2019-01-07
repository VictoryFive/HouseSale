<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=v7ugaj8evae4hfLSRrlxn6cRAYIMixt2"></script>
<title>Document</title>
</head>
<style>
* {
	margin: 0px;
	padding: 0px;
}

#top0 {
	height: 35px;
	box-shadow: 0 1px 0 0 #eee;
	margin-bottom: 8px;
}

#top0 a {
	font-size: 13px;
	text-decoration: none;
	margin-left: 30px;
	color: #9b9b9b;
}

.header {
	font-size: 35px;
	font-weight: bold;
	letter-spacing: 10px;
	font-style: 微软雅黑;
}

.page-header {
	height: 500px;
	background: url("static/images/113.jpg") no-repeat scroll top center/cover;
	font-weight: 300;
	z-index: 0;
	text-align: center;
	color: white;
	padding-top: 80px;
}

.mid {
	box-shadow: darkgrey 10px 10px 30px 5px;
	height: 550px;
	position: absolute;
	z-index: 10;
	top: 300px;
	margin-left: 10%;
	background-color: white;
	width: 80%;
}

#left {
	height: 50%;
	width: 60%;
	float: left;
}

#right {
	float: left;
	width: 40%;
	height: 50%;
	font-weight: bold;
	margin-top: 35px;
}

#bottom {
	background-color: white;
	height: 100%;
	position: absolute;
	z-index: 10;
	margin: 0px 0px 0px 150px;
}

.white {
	height: 700px;
	z-index: 0;
	background-color: #f5f5f6;
}

#back {
	float: right;
	margin: 0px 40px 0px 0px;
}

#container {
	box-shadow: darkgrey 10px 10px 30px 5px;
}

.img {
	height: 550px;
	width: 700px;
}

.uu {
	padding: 0;
	height: 10%;
	margin: 0px 0px 0px 0px;
}

.ii {
	line-height: 300%;
	text-align: center;
	width: 25%;
	float: left;
	height: 60px;
	list-style-type: none;
	background-color: #5D6D7E;
}

.iii {
	line-height: 300%;
	text-align: center;
	width: 25%;
	float: left;
	margin: 10px 0px 0px 0px;
	list-style-type: none;
	background-color: grey;
}

.iii:hover {
	background-color: #D0D3D4;
}

.ii:hover {
	background-color: #D0D3D4;
}

.hh {
	width: 25%;
	float: left;
	list-style-type: none;
	background-color: #28B463;
}

#hat {
	width: 100%;
	height: 80px;
	float: right;
	top: 1000px;
}

#dang {
	height: 600px;
	width: 150px;
	background-color: #f5f5f6;;
	top: 970px;
	z-index: 100;
	position: absolute;
}

.button {
	width: 100px;
	height: 56px;
	background: #2B2B2B;
	color: white;
	float: right;
	float: top;
	font-weight: bold;
}

.body-text {
	color: gray;
	font-size: 13px;
}

.body-text1 {
	color: white;
	font-size: 17px;
	margin-left: 30px;
}

.body-text2 {
	color: gray;
	font-size: 15px;
	margin-left: 30px;
}

.body-text2:HOVER {
	color: #f5f5f6;
}

.body-text1:HOVER {
	color: black;
}
</style>
<body onload="mmapp();">

	<%
		String h_name = request.getParameter("name");
		String h_info = request.getParameter("con");
		String h_distric = request.getParameter("add");
		Double h_area = Double.parseDouble(request.getParameter("area"));
		String h_type = request.getParameter("types");
		String h_date = request.getParameter("date");
		String h_money = request.getParameter("money");
		String h_RB = request.getParameter("RB");
		String h_design = request.getParameter("design");
		String h_url = request.getParameter("url");
		String housetype = request.getParameter("housetype");
		request.setAttribute("area", h_area);
		request.setAttribute("distric", h_distric);
		request.setAttribute("design", h_design);
		request.setAttribute("con", h_info);
		request.setAttribute("money", h_money);
		request.setAttribute("name", h_name);
		request.setAttribute("RB", h_RB);
		request.setAttribute("type", h_type);
		request.setAttribute("url", h_url);
		request.setAttribute("housetype", housetype);
		request.setAttribute("date", h_date);
	%>
	<!-- page header -->

	<div id="top0">
		<div style="margin-left: 12%; padding-top: 7px;">
			<a href="${pageContext.request.contextPath}/index.jsp">首页</a> <a
				href="${pageContext.request.contextPath}/jsp/BuyResoldSearch.jsp">二手房</a>
			<a href="${pageContext.request.contextPath}/jsp/BuyNewSearch.jsp">新房</a>
			<a href="${pageContext.request.contextPath}/jsp/RentSearch.jsp">租房</a>
			<a>小区</a> <a>房价</a> <a>工具</a> <a>指南</a> <a>业主</a> <a>经纪人</a>
			<c:if test="${not empty sessionScope.name}">
				<a style="margin-left: 350px;">你好，${sessionScope.name}</a>
				<a href="${pageContext.request.contextPath}/loginout">注销</a>
			</c:if>
			<c:if test="${empty sessionScope.name}">
				<a style="margin-left: 350px;"
					href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a>
			</c:if>
			<a href="${pageContext.request.contextPath}/jsp/register.jsp">注册</a>
			<a href="**">下载APP</a>
		</div>

	</div>


	<div class="page-header">
		<h1 class="header">房产信息</h1>
		<p style="font-size: 16px; letter-spacing: 3px; margin-top: 5px;">专注做房产</p>
	</div>

	<div class="mid">

		<div id="left">
			<img class="img"
				src="${pageContext.request.contextPath}<%=request.getParameter("url")%>"
				alt="11" />
		</div>


		<div id="right">
			<a style="font-size: 25px; font-weight: bold; color: #333">${RB}房&nbsp;&nbsp;<span
				style="font-size: 30px;">·</span>&nbsp;&nbsp;${name}
			</a>
			<c:choose>
			<c:when test="${RB=='租'}">
			    <p style="color: #aaaaaa; margin-left: 250px; margin-top: 20px;letter-spacing: 3px;">最短租期:&nbsp;${date}月</p>
			</c:when>
			<c:when test="${RB=='二手'||RB=='新'}">
				 <p style="color: #aaaaaa; margin-left: 250px; margin-top: 20px;letter-spacing: 2px;">房源上架时间:&nbsp;${date}</p>
			</c:when>
			
			</c:choose>
			<p
				style="color: #f15044; border: none; font-size: 60px; font-weight: bolder; margin-top: 20px; margin-left: 20px;">
				<c:choose>
					<c:when test="${RB=='新'}">
				  ${money}<span style="font-size: 15px;">万</span>
						<span style="font-size: 18px; color: #333; margin-left: 55px;">${con}元/平米</span>
						<br>

					</c:when>
					<c:when test="${RB=='租'}">
				  ${money}<span style="font-size: 18px; color: #333; margin-left: 10px;">${con}元/月</span>
				  </c:when>
					<c:when test="${RB=='二手'}">
				  ${money}<span style="font-size: 15px;">万</span>
					</c:when>
				</c:choose>
			</p>
			<div
				style="height: 1px; width: 410px; background-color: #f5f5f6; margin-top: 30px; margin-left: 10px;"></div>
			<div style="font-size: 30px; color: #333; margin-top: 20px;">
				<a style="margin-left: 45px;">${type}</a><a
					style="margin-left: 50px;">${area}<span
					style="font-size: 15px;">平米</span></a><a
					style="margin-left: 50px; color: #269CFF; font-size: 20px;">${housetype}区</a>
			</div>
			<div
				style="height: 1px; width: 410px; background-color: #f5f5f6; margin-top: 30px; margin-left: 10px;"></div>
			<div style="margin-top: 30px; margin-left: 40px;">
				<p style="font-size: 15px; color: #aaaaaa">
					<span style="color: #333; margin-right: 30px;">地区名称:</span>${distric}</p>
				<p style="font-size: 15px; color: #aaaaaa; margin-top: 30px;">
					<span style="color: #333; margin-right: 30px;">所属区域:</span>${design}</p>
				<input
					style="border: 1px solid #00AE66; width: 100px; height: 20px; color: #00AE66; margin-top: 45px;"
					type="text" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随时看房">
				<input
					style="border: 1px solid orange; width: 100px; height: 20px; color: orange; margin-left: 20px;"
					type="text" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;集中供暖">
				<input
					style="border: 1px solid #357eac; width: 100px; height: 20px; color: #357eac; margin-left: 20px;"
					type="text" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;靠近地铁">
			</div>
		</div>
	</div>
	
		<div id="divide"
			style="width: 100%; height: 60px; background-color: #333; z-index: 50; color: white;margin-top: 250px;">
			<h2 style="text-align: center;padding-top: 10px;letter-spacing: 3px;">地图·交通·周边</h2>
		</div>
		<div id="bottom">
		<div
			style="position: absolute; z-index: 20; top: 50px; left: 0px; width: 1200px; height: 600px;"
			id="container"></div>
		<div id="xx"
			style="z-index: 30; OVERFLOW-Y: auto; OVERFLOW-X: hidden; opacity: 0.8; background-color: #ffffff; position: absolute; top: 50px;left:-300px ;width: 300px; height: 600px;">
			<ul class="uu">
				<li class="ii">教育</li>
				<li class="ii">医疗</li>
				<li class="ii">购物</li>
				<li class="ii">交通</li>

			</ul>

			<ul class="uu" id="J_List"></ul>


		</div>


	</div>


	<div class="white">

		 <div id="dang"></div> 
	</div>

<footer style="height: 300px; background-color: #333;">
		<div style="margin-left: 15%; padding-top: 55px;">
			<a class="body-text1">网络地图</a><a class="body-text1">了解R&B</a><a
				class="body-text1">联系我们</a><a class="body-text1">加入我们</a><a
				class="body-text1">隐私声明</a><a class="body-text1">经纪人登陆</a>
		</div>
		<div
			style="margin-left: 17%; margin-right: 20%; height: 1px; background-color: gray; margin-top: 20px;"></div>
		<div style="margin-left: 15%; padding-top: 25px;">
			<a class="body-text2">城市二手房</a> <a class="body-text2">商圈二手房</a><a
				class="body-text2">热门小区二手房</a><a class="body-text2">新房楼盘</a><a
				class="body-text2">推荐楼盘</a><a class="body-text2">人气楼盘</a>
		</div>
		<div style="margin-left: 15%; padding-top: 25px;">
			<a class="body-text2">上海二手房</a> <a class="body-text2">北京二手房</a><a
				class="body-text2">青岛二手房</a><a class="body-text2">杭州二手房</a><a
				class="body-text2">广州二手房</a><a class="body-text2">更多二手房</a>
		</div>
		<div style="padding-top: 40px; margin-left: 17%;">
			<a class="body-text">地址/Address:山东省青岛市市南区宁夏路308号&nbsp;&nbsp;|</a> <a
				class="body-text">电话/Tel:4008-820-820&nbsp;&nbsp;|</a> <a
				class="body-text last">邮箱/Mail:WeAreBestCowB@163.com&nbsp;&nbsp;|</a>
			<a class="body-text">&copy; 2018 B&RINDEX.COM All Rights Reserved</a>
		</div>
	</footer>

	

</body>
<script type="text/javascript">  
  
var o = 0;
var x = "<%=request.getParameter("x")%>";  
var y = "<%=request.getParameter("y")%>";  
	var local;
	var local2;
	var p = true;

	function mmapp() {
		var map = new BMap.Map("container"); //创建地图容器
		var point = new BMap.Point(x, y); //创建一个点
		var myIcon = new BMap.Icon("static/images/2.png", new BMap.Size(60, 60));
		var marker = new BMap.Marker(point, {
			icon : myIcon
		}); // 创建标注
		marker.addEventListener("click", function(e) {
			if (p) {
				one();
			} else {
				two();
			}

		});
		local2 = new BMap.LocalSearch(map, {
			//
			onSearchComplete : function(results) {
				// 判断状态是否正确
				if (local.getStatus() == BMAP_STATUS_SUCCESS) {
					var s = [];
					o = results.getCurrentNumPois();
					for (var i = 0; i < results.getCurrentNumPois(); i++) {
						s.push(results.getPoi(i).title + ", "
								+ results.getPoi(i).address);
						addLi(i);//添加左侧栏信息
						document.getElementById(i).value = s[i];

					}

					//document.getElementById("r-result").innerHTML = s.join("<br/>");
				}
			}

		});
		local = new BMap.LocalSearch(map, {

			renderOptions : {
				map : map
			}

		});

		map.centerAndZoom(point, 17);
		map.enableScrollWheelZoom(true);
		map.addOverlay(marker);
	}
	function addLi(i) {
		var li_1 = document.createElement("output");
		var li_2 = document.createElement("li");

		li_2.style.width = "100%";
		li_2.setAttribute("class", "iii");
		li_1.setAttribute("id", i);
		li_2.setAttribute("id", "a" + i);
		document.getElementById("J_List").appendChild(li_2);
		document.getElementById("a" + i).appendChild(li_1);
	}
	function removeLi() {
		var nodeul = document.getElementById('J_List');//找到父节点

		for (var i = 0; i < o; i++) {
			var li_lan = nodeul.children[0];//找到要删除的子节点
			nodeul.removeChild(li_lan);//使用removeChild()函数删除
		}
	}

	function school() {
		removeLi();
		local.searchNearby("学校", new BMap.Point(x, y), 1000);//地图标识
		local2.searchNearby("学校", new BMap.Point(x, y), 1000);//左侧信息

	}
	function hospital() {
		removeLi();
		local.searchNearby("医院", new BMap.Point(x, y), 1000);
		local2.searchNearby("医院", new BMap.Point(x, y), 1000);

	}
	function supermarket() {
		removeLi();
		local.searchNearby("超市", new BMap.Point(x, y), 1000);
		local2.searchNearby("超市", new BMap.Point(x, y), 1000);
	}
	function traffic() {
		removeLi();
		local.searchNearby("公交站", new BMap.Point(x, y), 1000);
		local2.searchNearby("公交站", new BMap.Point(x, y), 1000);

	}

	//

	var xx = document.getElementById('xx');
	var xxleft = parseInt(xx.style.left);
	var t;

	function one() {

		t = setInterval(rollRight, 1);
		p = false;
	}
	function two() {
		t = setInterval(rollLeft, 1);
		p = true;
	}

	//向左移动
	function rollLeft() {

		xxleft--;
		xxleft--;
		xxleft--;
		xx.style.left = xxleft + 'px';
		if (xxleft <= -320) {
			clearInterval(t);
		}

	}
	//向右移动
	function rollRight() {

		xxleft++;
		xxleft++;
		xxleft++;
		xx.style.left = xxleft + 'px';
		if (xxleft >= -8) {
			clearInterval(t);
		}
	}

	var oli = document.getElementsByClassName("ii");

	oli[0].onclick = function() {
		school();
	};
	oli[1].onclick = function() {
		hospital();
	};
	oli[2].onclick = function() {
		supermarket();
	};
	oli[3].onclick = function() {
		traffic();
	};

</script>
</html>