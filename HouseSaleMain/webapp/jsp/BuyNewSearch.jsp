<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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

#top {
	height: 60px;
	background-color: #333;
}

#top a {
	font-size: 18px;
	color: white;
	text-decoration: none;
	margin-left: 40px;
}

#top2 {
	height: 450px;
	position: relative;
	width: 270px;
	top: -450px;
	left: 250px;
	background-color: rgba(0, 0, 0, 0.5);
}

#selectdiv {
	height: 70%;
	width: 250px;
}

#selectdiv select {
	margin-top: 20px;
	height: 30px;
	width: 100px;
	height: 30px;
	margin-left: 20px;
	border-radius: 5px;
	color: white;
	background-color: rgba(0, 0, 0, 0.4);
}

li {
	list-style-type: none;
}

#searchbtn {
	height: 30px;
	width: 120px;
	margin-left: 70px;
	border: none;
	border-radius: 5px;
	background-color: sandybrown;
	color: white;
	font-size: 15px;
	border: none;
	margin-left: 70px;
}

#list {
	margin-top: -450px;
	margin-left: 10%;
	margin-right: 10%;
}

#mainA {
	font-size: 28px;
	color: black;
	font-weight: bold;
	text-decoration: none;
	letter-spacing: 2px;
}

#mainA:HOVER {
	color: sandybrown;
}

#span1 {
	font-size: 16px;
	color: gray;
}

#span2 {
	font-size: 18px;
	color: #333;
	margin-left: 20px;
}

#span3 {
	margin-left: 15px;
	font-size: 14px;
}

#price {
	color: red;
	font-size: 30px;
	font-weight: bold;
}

#nli {
	margin-top: 8px;
}

#list_div {
	height: 220px;
	width: 220px;
	float: left;
}

#list_inner1 {
	margin-top: 20px;
	height: 220px;
	width: 580px;
	float: left;
	background-color: #f7f7f7;
	margin-left: 20px;
}

#list_inner2 {
	margin-top: 20px;
	height: 300px;
	width: 250px;
	background-color: #f7f7f7;
	margin-left: 20px;
}

#ul {
	height: 490px;
}

#imgstyle {
	width: 220px;
	height: 200px;
}

#formation {
	height: 50px;
	margin-top: 20px;
	border-bottom: solid 5px #333;
}

#formation li {
	height: 50px;
	width: 90px;
	float: left;
	margin-left: 20px;
}

#formation a {
	margin-left: 22px;
	float: left;
	margin-top: 19px;
	color: white;
	font-size: 13px;
	text-decoration: none;
}

#AescBtn, #MescBtn {
	height: 50px;
	width: 90px;
	border: none;
	background-color: white;
	color: gray;
}

#pagebtn {
	color: #333;
	font-weight: bold;
	font-size: 50px;
	border: none;
	background-color: white;
}

#ad_img {
	margin-top: 5px;
	height: 450px;
}

#inner a {
	width: 5px;
	height: 5px;
	display: block;
	border: 1px solid white;
	background-color: gray;
	float: left;
	margin: 0 10px;
	border-radius: 10px;
	text-align: center;
	text-decoration: none;
}

div#inner {
	width: 200px;
	height: 20px;
	position: relative;
	top: 430px;
	left: 520px;
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
</style>
</head>
<script src="../static/js/jquery-2.1.1.min.js"></script>
<script>
	window.onload = function() {

		ajaxCondition(0, 'h_id');

	}

	function test() {//传值方法
		var distric = document.getElementById("distric").value;
		var money = document.getElementById("money").value;
		var area = document.getElementById("area").value;
		var types = document.getElementById("types").value;
		var a1 = "", a2 = "";
		var m1 = "", m2 = "";

		if (distric == "城区") {//若点城区这个a标签
			distric = "";
		}

		if (money == "总价") {
			m1 = "";
			m2 = "";
		} else {
			if (money == "80万以下") {
				m1 = "0";
				m2 = "80";
			} else {
				if (money == "500万以上") {
					m1 = "500";
					m2 = "1000";
				} else {
					var arr = money.split("-");
					if (arr[1].length == 3) {
						m1 = arr[0];
						m2 = arr[1].substring(0, 2);
					} else {
						m1 = arr[0];
						m2 = arr[1].substring(0, 3);
					}
					;

				}
			}
		}
		switch (area) {
		case "50平以下":
			a1 = "0";
			a2 = "50";
			break;
		case "200平以上":
			a1 = "200";
			a2 = "400";
			break;
		case "50-70平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 2);
			break;
		case "70-90平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 2);
			break;
		case "90-110平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 3);
			break;
		case "110-130平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 3);
			break;
		case "130-150平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 3);
			break;
		case "150-200平":
			var arr = area.split("-");
			a1 = arr[0];
			a2 = arr[1].substring(0, 3);
			break;
		case "200平以上":
			area = area.substring(0, 3);
			break;
		case "面积":
			a1 = "";
			a2 = "";
			break;
		default:
			var arr = area.split("-");
			if (arr[1].length == 3) {
				a1 = arr[0];
				a2 = arr[1].substring(0, 2);
			} else {
				a1 = arr[0];
				a2 = arr[1].substring(0, 3);
			}

		}

		if (types == "房型") {
			types = "";
		} else {
			if (types == "5室及以上") {
				types = "5室";
			}
		}

		/* alert(distric + "," + a1 + "," + a2 + "," + m1 + "," + m2 + "," + types);   */
		var myValue = new Array();

		myValue[0] = distric;
		myValue[1] = m1;
		myValue[2] = m2;
		myValue[3] = a1;
		myValue[4] = a2;
		myValue[5] = types;

		return myValue;
	}

	function num(a, data) {

		$("#ul li").eq(0).nextAll().remove();

		var item;
		var result;
		for (var i = a; i < a + 4; i++) {
			result = data.msg[i];

			var id = result.h_id;
			var name = result.h_name;
			var add = result.h_province + result.h_city + result.h_distric;
			var area = result.h_area;
			var distric = result.h_distric;
			var types = result.h_type;
			var money = result.h_money;
			var date = result.h_date;
			var design = result.h_design;
			var housetype = result.h_houseType;
			var RB = result.h_RB;
			var url = result.h_url;
			var x = result.h_x;
			var y = result.h_y;
			var con = result.h_info;
			item = "<li id='list_inner1'><div id='list_div'><img id='imgstyle' alt='11' src='.."+url+"'></div>"
					+ "<div id='list_div' style='width:350px;'><ul style='margin-left:35px;'><li id='nli'>"
					+ "<a id='mainA' href='../onehouse.jsp?name="
					+ name
					+ "&add="
					+ add
					+ "&RB="
					+ RB
					+ "&area="
					+ area
					+ "&types="
					+ types
					+ "&date="
					+ date
					+ "&money="
					+ money
					+ "&x="
					+ x
					+ "&y="
					+ y
					+ "&con="
					+ con
					+ "&housetype="
					+ housetype
					+ "&url="
					+ url
					+ "&design="
					+ design
					+ "'>"

					+ name
					+ "</a>"
					+ "<span style='border: solid 1px #269CFF; margin-left: 20px; color: #269CFF'>"
					+ housetype
					+ "</span></li><li id='nli' style='margin-top:15px;'>"
					+ "<span id='span1' style='font-size: 20px;'>▶</span><span id='span2'>"
					+ distric
					+ "</span></li><li id='nli'><span id='span1'>建面:</span>"
					+ "<span id='span2'>"
					+ area
					+ "㎡</span></li><li id='nli'><span id='span1'>均价:</span>"
					+ "<span id='span2' style='color: #f15044; font-weight: bold;'>"
					+ con
					+ "元/平</span></li><li id='nli'><span id='span1'>总价:</span>"
					+ "<span id='span2'>"
					+ money
					+ "万/套</span></li><li id='nli' style='margin-left:-20px;'>"
					+ "<div style='background-color: #00AE66; margin-left: 30px; color: white; width: 60px; height: 22px; border-radius: 3px; float: left'>"
					+ "<span id='span3'>在售</span></div><div style='background-color: orange; margin-left: 20px; color: white; width: 90px; height: 22px; border-radius: 3px; float: left'>"
					+ "<span id='span3'>"
					+ design
					+ "</span>"
					+ "</div>"
					+ "<div  style='background-color: red; margin-left: 20px; color: white; width: 80px; height: 22px; border-radius: 3px; float: left'>"
					+ "<span style='margin-left: 15px; font-size: 14px;'>"
					+ types + "</span></div></li></ul></div></li>"
			$("#ul").append(item);
		}
	}

	var t = 0;

	function ajaxCondition(b, v) {

		var distric = test()[0];
		var minmoney = test()[1];
		var maxmoney = test()[2];
		var minarea = test()[3];
		var maxarea = test()[4];
		var types = test()[5];

		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/ajaxhouse",
			data : {
				distric : distric,
				minmoney : minmoney,
				maxmoney : maxmoney,
				minarea : minarea,
				maxarea : maxarea,
				types : types,
				RB : "新",
				EscORDesc : v
			},
			dataType : "json",
			success : function(data) {
				if (data.msg == "fail") {
					$("#ul li").eq(0).nextAll().remove();
					item1 = "<li><p>对不起未找到相关内容！</p></li>"
					$("#ul").append(item1);
				} else {

					if (b == 0) {
						t = 0;
					}
					if (b == 2) {
						t = t - 5
					}
					if (b == 1) {
						t = t + 5;
					}

					num(t, data);

				}

			},
			error : function(data) {
				alert(data.msg);
			}
		});

	}

	function Aesc() {
		var btn = document.getElementById("AescBtn");
		var btn1 = document.getElementById("MescBtn");
		var li1 = document.getElementById("li1");
		var lia = document.getElementById("lia");
		btn.style.backgroundColor = "sandybrown";
		btn.style.color = "white";
		btn1.style.backgroundColor = "white";
		btn1.style.color = "black";
		btn1.value = "售价";
		li1.style.backgroundColor = "white";
		lia.style.color = "black";

		if (btn.value == "面积") {
			btn.value = "面积 ↑";
			ajaxCondition(0, 'h_area0');
		} else if (btn.value == "面积 ↑") {
			btn.value = "面积 ↓";
			ajaxCondition(0, 'h_area1');
		} else {
			btn.value = "面积";

		}

	}

	function Mesc() {
		var btn = document.getElementById("AescBtn");
		var btn1 = document.getElementById("MescBtn");
		var li1 = document.getElementById("li1");
		var lia = document.getElementById("lia");
		btn1.style.backgroundColor = "sandybrown";
		btn1.style.color = "white";
		btn.style.backgroundColor = "white";
		btn.style.color = "black";
		li1.style.backgroundColor = "white";
		lia.style.color = "black";
		btn.value = "面积";

		if (btn1.value == "售价") {
			btn1.value = "售价 ↑";
			ajaxCondition(0, 'h_money0');
		} else if (btn1.value == "售价 ↑") {
			btn1.value = "售价 ↓";
			ajaxCondition(0, 'h_money1');
		} else {
			btn1.value = "售价";

		}

	}

	function defaultEsc() {
		var btn = document.getElementById("AescBtn");
		var btn1 = document.getElementById("MescBtn");
		var li1 = document.getElementById("li1");
		var lia = document.getElementById("lia");
		btn1.style.backgroundColor = "white";
		btn1.style.color = "black";
		btn.style.backgroundColor = "white";
		btn.style.color = "black";
		li1.style.backgroundColor = "sandybrown";
		lia.style.color = "white";
		btn.value = "面积";
		btn1.value = "售价";
		ajaxCondition(0, 'h_id')
	}

	function changePic(picName) {
		document.getElementById("ad_img").style.backgroundImage = "url(../static/images/"
				+ picName + ")";

	}

	function displayDiv() {
		var c = document.getElementById("likers");
		c.style.display = "block";
	}
</script>
<body>
	<div id="top0">
		<div style="margin-left: 12%; padding-top: 7px;">
			<a href="${pageContext.request.contextPath}/index.jsp">首页</a> <a
				href="${pageContext.request.contextPath}/jsp/BuyResoldSearch.jsp">二手房</a>
			<a href="${pageContext.request.contextPath}/jsp/BuyNewSearch.jsp">新房</a>
			<a href="${pageContext.request.contextPath}/jsp/RentSearch.jsp">租房</a>
			<a>小区</a> <a>房价</a> <a>工具</a> <a>指南</a> <a>业主</a> <a>经纪人</a>
			<c:if test="${not empty name}">
				<a style="margin-left: 350px;">你好，${name}</a>
				<a href="${pageContext.request.contextPath}/loginout">注销</a>
			</c:if>
			<c:if test="${empty name}">
				<a style="margin-left: 350px;"
					href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a>
			</c:if>
			<a href="${pageContext.request.contextPath}/jsp/register.jsp">注册</a>
			<a href="**">下载APP</a>
		</div>

	</div>
	<div id="top">
		<a
			style="color: white; margin-left: 18%; font-size: 40px; ont-weight: bolder;font-style: italic;">新房</a>
		<a style="margin-left: 200px;"
			href="${pageContext.request.contextPath}/index.jsp">首页</a> <a>楼盘</a>
		<a>在售</a> <a href="${pageContext.request.contextPath}/MapMain.jsp">地图找房</a> <a style="margin-left: 25%;">客服热线：400-588-1998</a>
	</div>

	<div id="ad_img" style="background-image: url(../static/images/9.jpg);">
		<div id="inner">
			<a href="javascript:changePic('9.jpg');"></a> <a
				href="javascript:changePic('8.jpg');"></a> <a
				href="javascript:changePic('7.jpg');"></a> <a
				href="javascript:changePic('10.jpg');"></a> <a
				href="javascript:changePic('11.jpg');"></a>
		</div>
	</div>

	<div id="top2">
		<div id="selectdiv">
			<select style="margin-top: 70px;" id="distric">
				<option>城区</option>
				<option>崂山区</option>
				<option>即墨区</option>
				<option>李沧区</option>
				<option>莱西区</option>
				<option>城阳区</option>
				<option>市南区</option>
				<option>市北区</option>
				<option>黄岛区</option>
				<option>胶州区</option>
				<option>平度区</option>
			</select> <select id="types">
				<option>房型</option>
				<option>1室一厅</option>
				<option>2室一厅</option>
				<option>2室二厅</option>
				<option>3室二厅</option>
				<option>4室二厅</option>
				<option>5室三厅</option>
				<option>5室以上</option>
			</select> <br> <select id="money">
				<option>总价</option>
				<option>80万以下</option>
				<option>80-100万</option>
				<option>100-150万</option>
				<option>150-200万</option>
				<option>200-300万</option>
				<option>300-500万</option>
				<option>500万以上</option>
			</select> <select id="area">
				<option>面积</option>
				<option>50平以下</option>
				<option>50-70平</option>
				<option>70-90平</option>
				<option>90-110平</option>
				<option>110-130平</option>
				<option>130-150平</option>
				<option>150-200平</option>
				<option>200平以上</option>
			</select>
		</div>
		<input id="searchbtn" type="button" onclick="ajaxCondition(0,'h_id')"
			value="筛选">

	</div>
	<div id="list">

		<h1
			style="padding-top: 20px; margin-left: 43%; letter-spacing: 15px; font-style: 微软雅黑; color: #333">楼盘精选</h1>
		<div style="height: 70px;">

			<ul id="formation">
				<li id="li1" style="margin-left: 0px; background-color: sandybrown;"><a
					id="lia" onclick="defaultEsc()" href="javascript:void(0)">默认排序</a></li>
				<li><input id="AescBtn" type="button" onclick="Aesc()"
					value="面积"></li>
				<li><input id="MescBtn" type="button" onclick="Mesc()"
					value="售价"></li>

			</ul>
		</div>

		<ul id="ul">
			<li></li>
			<!-- <li id="list_inner1"><div id="list_div">
					<img id="imgstyle" alt="11" src="../images/img1.jpg">
				</div>
				<div id="list_div" style="width: 300px">
					<ul>
						<li id="nli"><a id="mainA">荣安水木清华</a><span
							style="border: solid 1px #269CFF; margin-left: 30px; color: #269CFF">商业区</span></li>
						<li id="nli" style="margin-top: 15px;"><span id="span1"
							style="font-size: 20px;">▶</span><span id="span2">崂山区</span></li>
						<li id="nli"><span id="span1">建面:</span><span id="span2">80㎡</span></li>
						<li id="nli"><span id="span1">均价:</span><span id="span2"
							style="color: #f15044; font-weight: bold;">10000元/平</span></li>
						<li id="nli"><span id="span1">总价:</span><span id="span2">80万/套起</span></li>
						<li id="nli" style="margin-left: -50px;"><div
								style="background-color: #00AE66; margin-left: 30px; color: white; width: 60px; height: 22px; border-radius: 3px; float: left">
								<span id="span3">在售</span>
							</div>
							<div
								style="background-color: orange; margin-left: 10px; color: white; width: 90px; height: 22px; border-radius: 3px; float: left">
								<span id="span3">靠近地铁</span>
							</div>
							<div
								style="background-color: red; margin-left: 10px; color: white; width: 80px; height: 22px; border-radius: 3px; float: left">
								<span id="span3">1室两厅</span>
							</div></li>
					</ul>
				</div></li> -->
		</ul>

	</div>
	<ul style="position: absolute; margin-top: -300px;">
		<li style="float: left; margin-left: 60px;"><input id="pagebtn"
			type="button" value="◁" onclick="ajaxCondition(2,'h_id')"></li>
		<li style="float: left; margin-left: 1320px;"><input id="pagebtn"
			type="button" value="▷" onclick="ajaxCondition(1,'h_id')"></li>
	</ul>

	<div
		style="margin-left: 10%; margin-right: 10%; height: 20px; font-size: 25px; margin-top: 20px; margin-bottom: 10px;">----------------------------------------------------------------------------------------------------------------</div>
	<div style="height: 70px;">

		<h1
			style="padding-top: 20px; margin-left: 44.5%; letter-spacing: 15px; font-style: 微软雅黑; color: #333">楼盘推荐</h1>
	</div>


	<div
		style="height: 450px; margin-left: 11%; margin-right: 10%; margin-top: 35px;">
		<ul>
			<li style="float: left;">
				<div style="margin-left: 15px;">
					<img style="width: 350px; height: 300px;" alt="11"
						src="../static/images/r.jpg">
				</div>
				<div style="margin-left: 30px;">
					<ul>
						<li id="nli"><a id="mainA">荣安水木清华</a><span
							style="border: solid 1px #269CFF; margin-left: 100px; color: #269CFF">住宅区</span></li>
						<li id="nli" style="margin-top: 15px;"><span id="span1"
							style="font-size: 20px;">▶</span><span id="span2">崂山区</span></li>
						<li id="nli"><span id="span1">均价:</span><span id="span2"
							style="color: #f15044; font-weight: bold;">18990元/平</span></li>

					</ul>
				</div>
			</li>
			<li style="float: left; margin-left: 42px;"><div
					style="margin-left: 15px;">
					<img style="width: 350px; height: 300px;" alt="11"
						src="../static/images/e.jpg">
				</div>
				<div style="margin-left: 30px;">
					<ul>
						<li id="nli"><a id="mainA">德胜水蓉家苑</a><span
							style="border: solid 1px #269CFF; margin-left: 100px; color: #269CFF">别墅区</span></li>
						<li id="nli" style="margin-top: 15px;"><span id="span1"
							style="font-size: 20px;">▶</span><span id="span2">市南区</span></li>
						<li id="nli"><span id="span1">均价:</span><span id="span2"
							style="color: #f15044; font-weight: bold;">28999元/平</span></li>
					</ul>
				</div></li>
			<li style="float: left; margin-left: 42px;"><div
					style="margin-left: 15px;">
					<img style="width: 350px; height: 300px;" alt="11"
						src="../static/images/w.jpg">
				</div>
				<div style="margin-left: 30px;">
					<ul>
						<li id="nli"><a id="mainA">希尔芙蓉嘉苑</a><span
							style="border: solid 1px #269CFF; margin-left: 100px; color: #269CFF">商业区</span></li>
						<li id="nli" style="margin-top: 15px;"><span id="span1"
							style="font-size: 20px;">▶</span><span id="span2">市北区</span></li>
						<li id="nli"><span id="span1">均价:</span><span id="span2"
							style="color: #f15044; font-weight: bold;">17989元/平</span></li>
					</ul>
				</div></li>

		</ul>
	</div>
	<div id="likers"
		style="height: 450px; margin-left: 11%; margin-right: 10%; margin-top: 35px; display: none;">
		<ul>
			<li style="float: left;">
				<div style="margin-left: 15px;">
					<img style="width: 350px; height: 300px;" alt="11"
						src="../static/images/r.jpg">
				</div>
				<div style="margin-left: 30px;">
					<ul>
						<li id="nli"><a id="mainA">荣安水木清华</a><span
							style="border: solid 1px #269CFF; margin-left: 100px; color: #269CFF">住宅区</span></li>
						<li id="nli" style="margin-top: 15px;"><span id="span1"
							style="font-size: 20px;">▶</span><span id="span2">崂山区</span></li>
						<li id="nli"><span id="span1">均价:</span><span id="span2"
							style="color: #f15044; font-weight: bold;">18990元/平</span></li>

					</ul>
				</div>
			</li>
			<li style="float: left; margin-left: 42px;"><div
					style="margin-left: 15px;">
					<img style="width: 350px; height: 300px;" alt="11"
						src="../static/images/e.jpg">
				</div>
				<div style="margin-left: 30px;">
					<ul>
						<li id="nli"><a id="mainA">德胜水蓉家苑</a><span
							style="border: solid 1px #269CFF; margin-left: 100px; color: #269CFF">别墅区</span></li>
						<li id="nli" style="margin-top: 15px;"><span id="span1"
							style="font-size: 20px;">▶</span><span id="span2">市南区</span></li>
						<li id="nli"><span id="span1">均价:</span><span id="span2"
							style="color: #f15044; font-weight: bold;">28999元/平</span></li>
					</ul>
				</div></li>
			<li style="float: left; margin-left: 42px;"><div
					style="margin-left: 15px;">
					<img style="width: 350px; height: 300px;" alt="11"
						src="../static/images/w.jpg">
				</div>
				<div style="margin-left: 30px;">
					<ul>
						<li id="nli"><a id="mainA">希尔芙蓉嘉苑</a><span
							style="border: solid 1px #269CFF; margin-left: 100px; color: #269CFF">商业区</span></li>
						<li id="nli" style="margin-top: 15px;"><span id="span1"
							style="font-size: 20px;">▶</span><span id="span2">市北区</span></li>
						<li id="nli"><span id="span1">均价:</span><span id="span2"
							style="color: #f15044; font-weight: bold;">17989元/平</span></li>
					</ul>
				</div></li>

		</ul>
	</div>



	<div
		style="height: 30px; margin-left: 10%; margin-right: 10%; border: 2px solid gray; margin-bottom: 25px; padding-top: 7px; margin-top: 10px;">
		<input type="button" onclick="displayDiv()" value="查看更多∨"
			style="background-color: white; border: none; margin-left: 46%; letter-spacing: 5px; color: gray">
	</div>
	<footer style="height: 300px; background-color: #333;">
		<div style="margin-left: 15%; padding-top: 55px;">
			<a class="body-text1">新房合作</a><a class="body-text1">了解R&B</a><a
				class="body-text1">联系我们</a><a class="body-text1">加入我们</a><a
				class="body-text1">隐私声明</a><a class="body-text1">经纪人登陆</a>
		</div>
		<div
			style="margin-left: 17%; margin-right: 20%; height: 1px; background-color: gray; margin-top: 20px;"></div>
		<div style="margin-left: 15%; padding-top: 25px;">
			<a class="body-text2">热门城市新房</a> <a class="body-text2">热门城市楼盘</a><a
				class="body-text2">热门楼盘</a><a class="body-text2">推荐城市新房</a><a
				class="body-text2">推荐楼盘</a><a class="body-text2">人气楼盘</a>
		</div>
		<div style="margin-left: 15%; padding-top: 25px;">
			<a class="body-text2">上海新房</a> <a class="body-text2">北京新房</a><a
				class="body-text2">青岛新房</a><a class="body-text2">杭州新房</a><a
				class="body-text2">广州新房</a><a class="body-text2">更多新房</a>
		</div>
		<div style="padding-top: 40px; margin-left: 17%;">
			<a class="body-text">地址/Address:山东省青岛市市南区宁夏路308号&nbsp;&nbsp;|</a> <a
				class="body-text">电话/Tel:4008-820-820&nbsp;&nbsp;|</a> <a
				class="body-text last">邮箱/Mail:WeAreBestCowB@163.com&nbsp;&nbsp;|</a>
			<a class="body-text">&copy; 2018 B&RINDEX.COM All Rights Reserved</a>
		</div>
	</footer>

</body>
</html>