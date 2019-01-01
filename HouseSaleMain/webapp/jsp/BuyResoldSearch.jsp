<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#top {
	height: 50px;
	margin-left: 7%;
	margin-right: 7%;
	border: solid 2px darkcyan;
}

#top2 {
	margin-top: 20px;
	height: 100px;
	margin-left: 7%;
	margin-right: 7%;
	background-color: darkcyan;
}

#top2 li {
	float: left;
}

#searchhouse {
	width: 530px;
	height: 40px;
	border: none;
	background-color: ghostwhite;
	color: darkcyan;
	font-size: 20px;
}

#searchbtn {
	width: 100px;
	height: 42px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	border: none;
	font-size: 20px;
	color: white;
	background-color: sandybrown;
}

#searchhome {
	height: 325px;
	margin-left: 7%;
	margin-right: 7%;
	margin-top: 20px;
	/* 	border: solid 2px darkcyan;
	box-shadow: 2px 2px 2px 0px darkgray; */
}

#searchhome li {
	font-size: 14px;
	float: left;
	margin-left: 6px;
	float: left;
	width: 100px;
	height: 30px;
	font-size: 13px;
	color: #232836;
	font-size: 13px;
}

li {
	list-style-type: none;
}

#list {
	margin-left: 10%;
	margin-right: 10%;
}

#list_div {
	margin-top: 10px;
	height: 160px;
	width: 350px;
	float: left;
}

#mainA {
	font-size: 28px;
	color: #333;
	font-weight: bold;
	text-decoration: none;
	letter-spacing: 3px;
}

#mainA:HOVER {
	color: darkcyan;
}

#span1 {
	font-size: 13px;
	font-weight: bold;
}

#price {
	color: #db4c3f;
	font-size: 30px;
	font-weight: bold;
}

#list_inner1 {
	height: 180px;
	width: 100%;
	border-bottom: solid 1px darkgray;
}

#imgstyle {
	width: 250px;
	height: 160px;
}

#btnmore, #btnmore2 {
	width: 120px;
	height: 30px;
	border: solid 1.5px darkcyan;
	background-color: white;
	border-radius: 5px;
	color: #232836;
}

#rigthbtn {
	width: 60px;
	height: 25px;
	border: none;
	background-color: darkcyan;
	border-radius: 5px;
	color: white;
	margin-left: 30px;
}

#mput1, #mput2, #aput1, #aput2 {
	width: 100px;
	height: 20px;
	border: solid 1.5px darkcyan;
	border-radius: 5px;
}

#distric, #area, #money, #types {
	width: 100px;
	height: 25px;
	text-align: center;
	border: solid 1.5px darkcyan;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	color: darkcyan;
}

#con {
	width: 70px;
	height: 42px;
	font-size: 15px;
	color: #232836;
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border: solid 2px sandybrown;
	border-top-left-radius: 7px
}

#deletebtn {
	height: 25px;
	width: 25px;
	background-color: red;
	color: white;
	border: none;
	font-weight: bold;
	border-top-right-radius: 12px;
	border-bottom-right-radius: 12px;
	font-weight: bold;
}

#formation {
	height: 50px;
	margin-top: 0px;
	border-bottom: solid 5px darkcyan;
}

#formation li {
	height: 49px;
	width: 100px;
	background-color: sandybrown;
	float: left;
	margin-left: 35px;
}

#formation a {
	margin-left: 22px;
	float: left;
	margin-top: 15px;
	color: white;
	font-size: 15px;
	text-decoration: none;
	width: 100px;
}

#formation select {
	height: 49px;
	width: 100px;
	color: sandybrown;
	font-size: 15px;
	background-color: white;
	border: none;
}

#pagebtn {
	border: solid 1.5px darkcyan;
	color: sandybrown;
	font-weight: bold;
}

#tag li {
	width: 100px;
	height: 20px;
	float: left;
	font-size: 13px;
	border-radius: 2px;
}
</style>
</head>
<script src="../js/jquery-2.1.1.min.js"></script>
<script>
	window.onload = function() {

		ajaxCondition(0, 'h_id');

	}

	function showMore() {
		var d = document.getElementById("btnmore");
		var m = document.getElementById("show1");

		if (d.value == "+ 更多及自定义") {

			d.value = "- 关闭";
			m.style.display = "block";
		} else {
			m.style.display = "none";
			d.value = "+ 更多及自定义"
		}

	}

	function showMore2() {
		var d = document.getElementById("btnmore2");
		var m = document.getElementById("show2");

		if (d.value == "+ 更多及自定义") {

			d.value = "- 关闭";
			m.style.display = "block";
		} else {
			m.style.display = "none";
			d.value = "+ 更多及自定义"
		}

	}

	function SearchList() {

		var con = document.getElementById("con").value;
		var c1 = document.getElementById("condition1");
		var c2 = document.getElementById("condition2");
		var c3 = document.getElementById("condition3");
		var c4 = document.getElementById("condition4");

		switch (con) {
		case "位置":
			c1.style.display = "block";
			$("#distric").val($("#searchhouse").val());
			$("#searchhouse").val("");
			ajaxCondition(0, 'h_id');
			break;
		case "价格":
			c2.style.display = "block";
			$("#money").val($("#searchhouse").val());
			$("#searchhouse").val();
			ajaxCondition(0, 'h_id');
			break;
		case "面积":
			c3.style.display = "block";
			$("#area").val($("#searchhouse").val());
			$("#searchhouse").val();
			ajaxCondition(0, 'h_id');
			break;
		case "类型":
			c4.style.display = "block";
			$("#types").val($("#searchhouse").val());
			$("#searchhouse").val();
			ajaxCondition(0, 'h_id');
			break;
		}

	}

	function printDistricInfo(value) {
		var c = document.getElementById("condition1");

		if ($(value).val() != "") {
			c.style.display = "block";
			$("#distric").val($(value).val());
		} else {
			$("#distric").val("");
			c.style.display = "none";

		}
		ajaxCondition(0, 'h_id');
	}

	function printMoneyInfo(value) {
		var c = document.getElementById("condition2");

		if ($(value).val() != "") {
			c.style.display = "block";
			$("#money").val($(value).val());
		} else {
			$("#money").val("");
			c.style.display = "none";
		}
		ajaxCondition(0, 'h_id');

	}

	function printAreaInfo(value) {
		var c = document.getElementById("condition3");

		if ($(value).val() != "") {
			c.style.display = "block";
			$("#area").val($(value).val());
		} else {
			$("#area").val("");
			c.style.display = "none";
		}
		ajaxCondition(0, 'h_id');

	}
	function printTypeInfo(value) {
		var c = document.getElementById("condition4");

		if ($(value).val() != "") {
			c.style.display = "block";
			$("#types").val($(value).val());
		} else {
			$("#types").val("");
			c.style.display = "none";
		}
		ajaxCondition(0, 'h_id');

	}

	function moneyself() {
		var v1 = document.getElementById("mput1");
		var v2 = document.getElementById("mput2");
		var c = document.getElementById("condition2");
		c.style.display = "block";
		$("#money").val(v1.value + "-" + v2.value + "万");
		ajaxCondition(0, 'h_id');
		v1.value = "";
		v2.value = "";
	}

	function areaself() {
		var v1 = document.getElementById("aput1");
		var v2 = document.getElementById("aput2");
		var c = document.getElementById("condition3");
		c.style.display = "block";
		$("#area").val(v1.value + "-" + v2.value + "平");
		ajaxCondition(0, 'h_id');
		v1.value = "";
		v2.value = "";

	}

	function test() {
		var distric = document.getElementById("distric").value;
		
		var money = document.getElementById("money").value;
		var area = document.getElementById("area").value;
		var types = document.getElementById("types").value;
		var a1 = "", a2 = "";
		var m1 = "", m2 = "";

		if (money == "") {
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
		case "":
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

		if (types == "") {
			types = "";
		} else {
			if (types == "5室及以上") {
				types = "%5室%";
			} else {
				types = "%" + types + "%";

			}
		}

		/* 		alert(distric + "," + a1 + "," + a2 + "," + m1 + "," + m2 + "," + types); */
		var myValue = new Array();

		myValue[0] = distric;
		myValue[1] = m1;
		myValue[2] = m2;
		myValue[3] = a1;
		myValue[4] = a2;
		myValue[5] = types;

		return myValue;
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
			url : "/ssh/ajaxhouse.mvc",
			data : {
				distric : distric,
				minmoney : minmoney,
				maxmoney : maxmoney,
				minarea : minarea,
				maxarea : maxarea,
				types : types,
				RB : "二手",
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

	function deleteInput(a, b, c) {
		var a = document.getElementById(a);
		$(b).val("");
		a.style.display = "none";
		$(c).attr("checked", false);
		$(c + "1").attr("checked", true);
		ajaxCondition(0);
	}

	function AEscOrDesc() {
		var Aesc = document.getElementById("Aesc").value;

		if (Aesc == "从小到大") {
			ajaxCondition(0, "h_area");
		} else if (Aesc == "从大到小") {
			ajaxCondition(0, "h_area desc");
		} else {

			ajaxCondition(0, 'h_id');
		}

	}

	function MEscOrDesc() {

		var Mesc = document.getElementById("Mesc").value;

		if (Mesc == "从小到大") {
			ajaxCondition(0, "h_money");
		} else if (Mesc == "从大到小") {
			ajaxCondition(0, "h_money desc");
		} else {

			ajaxCondition(0, 'h_id');
		}

	}

	function defaultEsc() {
		document.getElementById("Aesc").value = "面积排序";
		document.getElementById("Mesc").value = "售价排序";
		ajaxCondition(0, 'h_id');
	}

	function num(a, data) {

		$("#ul li").eq(0).nextAll().remove();

		var item;
		var result;

		for (var i = a; i < a + 5; i++) {
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
					+ "<div id='list_div'>"
					+ "<a id='mainA' href='onehouse2.jsp?name="
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
					+ "<br><br> <span id='span1' style='color:#666;'>青岛"
					+ distric
					+ "&nbsp&nbsp|</span>"
					+ "<span id='span1' style='margin-left: 10px;color:#666;'>"
					+ types
					+ "&nbsp&nbsp|</span>"
					+ "<span id='span1' style='margin-left: 10px;color:#666;'>"
					+ area
					+ "平米&nbsp&nbsp|</span><span id='span1' style='margin-left: 10px;color:#666;'>有电梯</span><br><br>"
					+ "<span id='span1' style='color: darkgray;'>"
					+ housetype
					+ "</span><span id='span1' style='margin-left: 10px;color: darkgray;'>精装即住</span>"
					+ "<span id='span1' style='margin-left: 10px; color: darkgray;'>"
					+ RB
					+ "房</span><ul id='tag' style='margin-top: 10px;'><li style='background-color: #ffece8; margin-left: -40px;	color: #FF8062;'>"
					+ "<span style='margin-left: 17px;'>随时看房</span></li><li style='background-color: #e1f5ed; margin-left: 8px;color: #33BE85;'>"
					+ "<span style='margin-left: 12px;'>"
					+ design
					+ "</span></li><li style='background-color:oldlace ; margin-left: 8px;color:orange'>"
					+ "<span style='margin-left: 8px;'>房本满五年</span></li></ul>"
					+ "</div>"
					+ "<div id='list_div' style='margin-left: 100px;'>"
					+ "<div style='margin-top: 50px;margin-left: 30px;'><span id='price'>"
					+ money
					+ "</span> <span style='color: #db4c3f;'>万/套</span><span	 style='margin-left: 50px; color: blue;'>"
					+ date + " 更新</span></div></div></li>"
			$("#ul").append(item);
		}
	}
</script>
<body>
	<div id="top">
		<h1 style="margin-top: 3px; margin-left: 20px; color: darkcyan;">二手房</h1>
	</div>
	<div id="top2">
		<ul style="padding-left: 100px; padding-top: 30px;">
			<li><select id="con">
					<option>条件</option>
					<option>位置</option>
					<option>价格</option>
					<option>面积</option>
					<option>类型</option>
			</select></li>
			<li><input id="searchhouse" type="text" /></li>
			<li><input id="searchbtn" value="搜索" type="button"
				onclick="SearchList()"></li>
		</ul>

	</div>
	<div id="searchhome">
		<ul style="padding-top: 20px;">
			<li
				style="width: 70px; color: sandybrown; font-size: 18px; font-weight: bold; margin-top: -5px;">位置&nbsp:</li>
			<li><input name="distric" id="Dchecked1" type="radio" value=""
				onclick="printDistricInfo(this)">不限</li>
			<li><input id="Dchecked" name="distric" type="radio" value="市南区"
				onclick="printDistricInfo(this)">市南</li>
			<li><input id="Dchecked" name="distric" type="radio" value="市北区"
				onclick="printDistricInfo(this)">市北</li>
			<li><input id="Dchecked" name="distric" type="radio" value="李沧区"
				onclick="printDistricInfo(this)">李沧</li>
			<li><input id="Dchecked" name="distric" type="radio" value="崂山区"
				onclick="printDistricInfo(this)">崂山</li>
			<li><input id="Dchecked" name="distric" type="radio" value="黄岛区"
				onclick="printDistricInfo(this)">黄岛</li>
			<li><input id="Dchecked" name="distric" type="radio" value="城阳区"
				onclick="printDistricInfo(this)">城阳</li>
			<li><input id="Dchecked" name="distric" type="radio" value="即墨区"
				onclick="printDistricInfo(this)">即墨</li>
			<li><input id="Dchecked" name="distric" type="radio" value="胶州区"
				onclick="printDistricInfo(this)">胶州</li>
			<li><input id="Dchecked" name="distric" type="radio" value="平度区"
				onclick="printDistricInfo(this)">平度</li>
			<li><input id="Dchecked" name="distric" type="radio" value="莱西区"
				onclick="printDistricInfo(this)">莱西</li>
		</ul>
		<ul style="padding-top: 30px;">
			<li
				style="width: 70px; color: sandybrown; font-size: 18px; font-weight: bold; margin-top: -5px;">售价&nbsp:</li>
			<li><input id="mchecked1" name="money" type="radio" value=""
				onclick="printMoneyInfo(this)">不限</li>
			<li><input id="mchecked" name="money" type="radio" value="80万以下"
				onclick="printMoneyInfo(this)">80万以下</li>
			<li><input id="mchecked" name="money" type="radio"
				value="80-100万" onclick="printMoneyInfo(this)">80-100万</li>
			<li><input id="mchecked" name="money" type="radio"
				value="100-150万" onclick="printMoneyInfo(this)">100-150万</li>
			<li><input id="mchecked" name="money" type="radio"
				value="150-200万" onclick="printMoneyInfo(this)">150-200万</li>
			<li><input id="mchecked" name="money" type="radio"
				value="200-300万" onclick="printMoneyInfo(this)">200-300万</li>
			<li><input id="mchecked" name="money" type="radio"
				value="300-500万" onclick="printMoneyInfo(this)">300-500万</li>
			<li style="margin-left: 80px;"><input id="btnmore" type="button"
				value="+ 更多及自定义" onclick="showMore()"></li>
		</ul>
		<ul id="show1" style="padding-top: 20px; display: none">
			<li><input id="mchecked" name="money" type="radio"
				value="500万以上" onclick="printMoneyInfo(this)">500万以上</li>
			<li style="width: 400px;"><input id="mput1" type="text">
				- <input id="mput2" type="text">&nbsp&nbsp万 <input
				id="rigthbtn" type="button" value="确定" onclick="moneyself()"></li>
		</ul>

		<ul style="padding-top: 30px;">
			<li
				style="width: 70px; color: sandybrown; font-size: 18px; font-weight: bold; margin-top: -5px;">面积&nbsp:</li>
			<li><input id="achecked1" name="area" type="radio" value=""
				onclick="printAreaInfo(this)">不限</li>
			<li><input id="achecked" name="area" type="radio" value="50平以下"
				onclick="printAreaInfo(this)">50平以下</li>
			<li><input id="achecked" name="area" type="radio" value="50-70平"
				onclick="printAreaInfo(this)">50-70平</li>
			<li><input id="achecked" name="area" type="radio" value="70-90平"
				onclick="printAreaInfo(this)">70-90平</li>
			<li><input id="achecked" name="area" type="radio"
				value="90-110平" onclick="printAreaInfo(this)">90-110平</li>
			<li><input id="achecked" name="area" type="radio"
				value="110-130平" onclick="printAreaInfo(this)">110-130平</li>
			<li><input id="achecked" name="area" type="radio"
				value="130-150平" onclick="printAreaInfo(this)">130-150平</li>
			<li style="margin-left: 30px;"><input id="btnmore2"
				type="button" value="+ 更多及自定义" onclick="showMore2()"></li>
		</ul>
		<ul id="show2" style="padding-top: 30px; display: none">
			<li><input id="achecked" name="area" type="radio"
				value="150-170平" onclick="printAreaInfo(this)">150-200平</li>
			<li><input id="achecked" name="area" type="radio" value="200平以上"
				onclick="printAreaInfo(this)">200平以上</li>
			<li style="width: 400px;"><input id="aput1" type="text">
				- <input id="aput2" type="text">&nbsp&nbsp平 <input
				id="rigthbtn" type="button" value="确定" onclick="areaself()"></li>
		</ul>

		<ul style="padding-top: 30px;">
			<li
				style="width: 70px; color: sandybrown; font-size: 18px; font-weight: bold; margin-top: -5px;">房型&nbsp:</li>
			<li><input id="tchecked1" name="types" type="radio" value=""
				onclick="printTypeInfo(this)">不限</li>
			<li><input id="tchecked" name="types" type="radio" value="1室"
				onclick="printTypeInfo(this)">一室</li>
			<li><input id="tchecked" name="types" type="radio" value="2室"
				onclick="printTypeInfo(this)">二室</li>
			<li><input id="tchecked" name="types" type="radio" value="3室"
				onclick="printTypeInfo(this)">三室</li>
			<li><input id="tchecked" name="types" type="radio" value="4室"
				onclick="printTypeInfo(this)">四室</li>
			<li><input id="tchecked" name="types" type="radio" value="5室及以上"
				onclick="printTypeInfo(this)">五室及以上</li>
		</ul>

		<ul style="padding-top: 30px;">
			<li
				style="width: 70px; color: sandybrown; font-size: 18px; font-weight: bold; margin-top: -5px;">条件&nbsp:</li>
			<li id="condition1" style="display: none; width: 150px;"><input
				id="distric" type="text"><input id="deletebtn" type="button"
				value="X"
				onclick="deleteInput('condition1', '#distric','#Dchecked')"></li>
			<li id="condition2" style="display: none; width: 150px;"><input
				id="money" type="text"><input id="deletebtn" type="button"
				value="X" onclick="deleteInput('condition2', '#money','#mchecked')"></li>
			<li id="condition3" style="display: none; width: 150px;"><input
				id="area" type="text"><input id="deletebtn" type="button"
				value="X" onclick="deleteInput('condition3', '#area','#achecked')"></li>
			<li id="condition4" style="display: none; width: 150px;"><input
				id="types" type="text"><input id="deletebtn" type="button"
				value="X" onclick="deleteInput('condition4', '#types','#tchecked')"></li>
		</ul>

	</div>

	<div id="list">
		<ul id="formation">
			<li style="margin-left: -40px;"><a href="javascript:void(0)"
				onclick="defaultEsc()">默认排序</a></li>
			<li><select id="Aesc" onchange="AEscOrDesc()">
					<option>面积排序</option>
					<option>从小到大</option>
					<option>从大到小</option>
			</select></li>
			<li><select id="Mesc" onchange="MEscOrDesc()">
					<option>售价排序</option>
					<option>从小到大</option>
					<option>从大到小</option>
			</select></li>

		</ul>


		<ul id="ul">
			<li></li>
			<!-- 	<li id="list_inner1"><div id="list_div">
					<img id="imgstyle" alt="11" src="images/img1.jpg">
				</div>
				<div id="list_div">
					<a id="mainA" href="index.jsp">腾讯科技集团</a> <br> <br> <span
						id="span1">位于上海</span> <span id="span1" style="margin-left: 10px;">666</span>
					<span id="span1" style="margin-left: 10px;">666平米</span> <br>
					<br> <span id="span1" style="color: gray;">靠近地铁</span> <span
						id="span1" style="margin-left: 10px; color: gray;">精装板房</span><span
						id="span1" style="margin-left: 10px; color: gray;"> 租</span>
				</div>
				<div id="list_div" style="margin-left: 50px;">

					<div style="margin-top: 50px; margin-left: 80px;">
						<span id="price">2000</span> <span>万元/套</span>
					</div>
				</div></li> -->

			<!-- 	<li id="list_inner1"><div id="list_div">
					<img id="imgstyle" alt="11" src="images/img1.jpg">
				</div>
				<div id="list_div">
					<a id="mainA" href="index.jsp">腾讯科技集团 家电齐全</a><br> <br> <span
						id="span1">青岛崂山区&nbsp&nbsp/</span> <span id="span1"
						style="margin-left: 3px;">2室一厅&nbsp&nbsp/</span> <span id="span1"
						style="margin-left: 3px;">69.8平米&nbsp&nbsp/</span> <span
						id="span1" style="margin-left: 3px;">有电梯</span><br> <span
						id="span1" style="color: darkgray;">商业区</span> <span id="span1"
						style="margin-left: 10px; color: darkgray;">精装板房</span><span
						id="span1" style="margin-left: 10px; color: darkgray;">出租房</span>

					<ul id="tag" style="margin-top: 10px;">
						<li style="background-color: palevioletred; margin-left: -40px;"><span
							style="margin-left: 17px;">随时看房</span></li>
						<li style="background-color: green; margin-left: 8px;"><span
							style="margin-left: 12px;">中心商业区</span></li>
						<li style="background-color: red; margin-left: 8px;"><span
							style="margin-left: 8px;">☀ 集中供暖</span></li>
					</ul>


				</div>
				<div id="list_div" style="margin-left: 100px;">
					<div style="margin-top: 50px; margin-left: 30px;">
						<span id="price">2000</span> <span>万元/套</span> <span
							style="margin-left: 50px; color: blue;">2018.5.7 发布</span>
					</div>

				</div></li> -->
		</ul>



		<div style="margin-top: 50px;">
			<input id="pagebtn" type="button" value="首页"
				onclick="ajaxCondition(0)"> <input id="pagebtn"
				type="button" value="上一页" onclick="ajaxCondition(2)"> <input
				id="pagebtn" type="button" value="下一页" onclick="ajaxCondition(1)">
		</div>
	</div>


</body>
</html>