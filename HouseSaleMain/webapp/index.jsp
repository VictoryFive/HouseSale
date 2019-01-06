<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/ionicons/2.0.1/css/ionicons.min.css">
<link rel="shortcut icon"
	type="${pageContext.request.contextPath}/static/images/x-icon"
	href="images/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Montserrat|Play"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/app.css">
</head>
<body>
	<header> <nav class="main-nav">
	<div class="container">
		<div class="row">
			<div class="col-1-4">
				<h1 class="logo">
					<a href="index.jsp">Buy-Rent</a> <img src="static/images/logo.png">
				</h1>
			</div>
			<div class="col-3-4">
				<ul id="menu" class="main-menu">
					<li><a href="index.jsp" class="active">首页</a></li>
					<li><a href="${pageContext.request.contextPath}/index.jsp">关于我们</a></li>
					<li><c:if test="${not empty userType}">
							<c:if test="${userType == 'buyer'}">
								<a
									href="${pageContext.request.contextPath}/jsp/BuyResoldSearch.jsp">二手房</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a
									href="${pageContext.request.contextPath}/jsp/BuyNewSearch.jsp">新房</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath}/jsp/RentSearch.jsp">租房</a>
							</c:if>
							<c:if test="${userType == 'saler'}">
								<a
									href="${pageContext.request.contextPath}/jsp/salerOfHouse.jsp">我的房产</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<select
									onchange="self.location.href=options[selectedIndex].value" style="font-size: 11.5px;border-color: white;">
									<option value="发布房源">发布房源</option>
									<option
										value="${pageContext.request.contextPath}/jsp/saleHouse.jsp">发布卖房</option>
									<option
										value="${pageContext.request.contextPath}/jsp/rentHouse.jsp">发布租房</option>
								</select>
							</c:if>
						</c:if> <c:if test="${empty userType}">
							<a href="${pageContext.request.contextPath}/jsp/login.jsp">请先登录
							</a>
						</c:if></li>
					<li><c:if test="${not empty name}">
							<a>你好，${name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/loginout">注销</a>
						</c:if> <c:if test="${empty name}">
							<a href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a>
						</c:if></li>
					<li><a
						href="${pageContext.request.contextPath}/jsp/register.jsp">注册</a></li>
				</ul>
			</div>
		</div>
	</div>
	</nav>

	<div class="hero-img">
		<img src="static/images/hero-img.jpg" alt="hero-img" class="hero">
		<div class="text-wrap">
			<p class="title">B&R</p>
			<p class="description">B-Buy AND R-Rent</p>
			<a href="${pageContext.request.contextPath}/toSearch" class="btn">寻找房源</a>
		</div>
	</div>
	</header>


	<div class="services-section">
		<div class="container">
			<div class="row">
				<div class="title-and-desc">
					<h2 class="section-title">
						<span class="separate">Buy&Rent</span> 为你为家
					</h2>
					<p class="body-text">集二手、新房、租房功能于一体，随时随地任性找房，</p>
					<p class="body-text">IM匿名咨询让您放心，消息动态推送让您省心，服务承诺让您安心，</p>
					<p class="body-text">数据百科锦囊让您感受贴心漫漫找房路，我们努力为您想更多</p>
				</div>
			</div>

			<div class="row">
				<div class="col-1-3">
					<div class="service">
						<a href="jsp/BuyResoldSearch.jsp"><img
							src="static/images/serv-ico1.png" alt="icon" class="serv-icon"></a>
						<p class="serv-title">二手好房&nbsp;&nbsp;&nbsp;为您而选</p>
						<p class="body-text">二手好房源那么多，我们为你精选，</p>
						<p class="body-text"></p>
						<p class="body-text">B&R越来越懂你</p>
					</div>
				</div>
				<div class="col-1-3">
					<div class="service">
						<a href="jsp/BuyNewSearch.jsp"><img
							src="static/images/serv-ico2.png" alt="icon" class="serv-icon"></a>
						<p class="serv-title">优质小区&nbsp;&nbsp;&nbsp;为您推荐</p>
						<p class="body-text">梦里寻他千百屋，蓦然回首，那屋却在灯火阑珊处</p>
						<p class="body-text"></p>
						<p class="body-text">纵览小区，恋上这座城</p>
					</div>
				</div>
				<div class="col-1-3">
					<div class="service">
						<a href="jsp/BuyNewSearch.jsp"><img
							src="static/images/serv-ico3.png" alt="icon" class="serv-icon"></a>
						<p class="serv-title">新房源&nbsp;&nbsp;&nbsp;新起航</p>
						<p class="body-text">真实信息准确同步，楼盘动态一手掌握</p>
						<p class="body-text"></p>
						<p class="body-text">新房源新起点</p>
					</div>
				</div>
				<div class="col-1-3">
					<div class="service">
						<a href="jsp/RentSearch.jsp"><img
							src="static/images/serv-ico4.png" alt="icon" class="serv-icon"></a>
						<p class="serv-title">爱租房&nbsp;&nbsp;&nbsp;省下钱</p>
						<p class="body-text">为您推荐最实惠，最优质的出租房源</p>
						<p class="body-text"></p>
						<p class="body-text">不为租房而愁</p>
					</div>
				</div>
				<div class="col-1-3">
					<div class="service">
						<a href="MapMain.jsp"><img src="static/images/serv-ico5.png"
							alt="icon" class="serv-icon"></a>
						<p class="serv-title">地图旅居&nbsp;&nbsp;&nbsp;自在人生</p>
						<p class="body-text">不负韶光，醉美山水，春风徐来，尽赏无限风光</p>
						<p class="body-text"></p>
						<p class="body-text">旅游买房，一站服务</p>
					</div>
				</div>
				<div class="col-1-3">
					<div class="service">
						<a href="MapMain.jsp"><img src="static/images/serv-ico6.png"
							alt="icon" class="serv-icon"></a>
						<p class="serv-title">地图找房&nbsp;&nbsp;&nbsp;交易安心</p>
						<p class="body-text">专业团队，海外房产，开启您的海外置业之旅</p>
						<p class="body-text"></p>
						<p class="body-text">出国旅游，选B&R</p>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- LATEST WORK SECTION -->
	<div class="latest-work">
		<div class="container">
			<h2 class="section-title">为您创造家的故事</h2>
			<p class="body-text">找图找房，为您精确定位，位置周边配套设施一览无余</p>
			<p class="body-text">房源紧邻地铁站，交通出行更方便，说走就走，实时定位为您寻找最好的房源</p>
			<div class="row">
				<div class="col-1-2">
					<a href="projectpage.html">
						<div class="img-wrapper">
							<img src="static/images/work-1.png" alt="work-img">
							<div class="img-hover">
								<div class="caption-box">
									<i class="ion-ios-eye-outline"></i>
									<p class="caption-text">查看该房信息</p>
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-1-2">
					<a href="projectpage.html">
						<div class="img-wrapper">
							<img src="static/images/work-2.png" alt="work-img">
							<div class="img-hover">
								<div class="caption-box">
									<i class="ion-ios-eye-outline"></i>
									<p class="caption-text">查看该房信息</p>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-1-2">
					<a href="projectpage.html">
						<div class="img-wrapper">
							<img src="static/images/work-3.png" alt="work-img">
							<div class="img-hover">
								<div class="caption-box">
									<i class="ion-ios-eye-outline"></i>
									<p class="caption-text">查看该房信息</p>
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-1-2">
					<a href="projectpage.html">
						<div class="img-wrapper">
							<img src="static/images/work-4.png" alt="work-img">
							<div class="img-hover">
								<div class="caption-box">
									<i class="ion-ios-eye-outline"></i>
									<p class="caption-text">查看该房信息</p>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-1-2">
					<a href="projectpage.html">
						<div class="img-wrapper">
							<img src="static/images/work-5.png" alt="work-img">
							<div class="img-hover">
								<div class="caption-box">
									<i class="ion-ios-eye-outline"></i>
									<p class="caption-text">查看该房信息</p>
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-1-2">
					<a href="projectpage.html">
						<div class="img-wrapper">
							<img src="static/images/work-6.png" alt="work-img">
							<div class="img-hover">
								<div class="caption-box">
									<i class="ion-ios-eye-outline"></i>
									<p class="caption-text">查看该房信息</p>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			<a href="work.html" class="all-work"> <i class="ion-grid"></i> <span>All
					Search</span>
			</a>
		</div>
	</div>

	<div class="our-clients">
		<div class="container">
			<h2 class="section-title">郑重承诺</h2>
			<p class="body-text">我们B&R励志于为用户创造最好的购房平台，绝对真实房源，真实价格</p>
			<p class="body-text">如有假冒伪劣，假一套赔十套</p>
			<div class="row">
				<div class="col-1-6">
					<img src="static/images/client1.png" alt="client-logo">
				</div>
				<div class="col-1-6">
					<img src="static/images/client2.png" alt="client-logo">
				</div>
				<div class="col-1-6">
					<img src="static/images/client3.png" alt="client-logo">
				</div>
				<div class="col-1-6">
					<img src="static/images/client4.png" alt="client-logo">
				</div>
				<div class="col-1-6">
					<img src="static/images/client5.png" alt="client-logo">
				</div>
				<div class="col-1-6">
					<img src="static/images/client6.png" alt="client-logo">
				</div>

			</div>
		</div>
	</div>

	<!-- FOOTER SECTION -->
	<footer>
	<div class="container">
		<p class="title">联系方式</p>
		<img src="static/images/logo-footer.png" alt="logo">
		<p class="body-text">地址/Address:山东省青岛市市南区宁夏路308号</p>
		<p class="body-text">电话/Tel:4008-820-820</p>
		<p class="body-text last">邮箱/Mail:WeAreBestCowB@163.com</p>
		<div class="social-media-footer">
			<a href="#"><i class="ion-social-facebook"></i></a> <a href="#"><i
				class="ion-social-linkedin"></i></a> <a href="#"><i
				class="ion-social-twitter"></i></a> <a href="#"><i
				class="ion-social-instagram-outline"></i></a>
		</div>
		<p class="copyright">&copy; 2018 B&RINDEX.COM All Rights Reserved</p>
	</div>
	</footer>

	<!-- SCRIPTS -->
	<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/app.js"></script>
</body>
</html>