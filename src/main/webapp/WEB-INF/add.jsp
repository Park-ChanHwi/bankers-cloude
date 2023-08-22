<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/vmadd.css">
<link rel="stylesheet" href="../css/hearder.css">
<link rel="stylesheet" href="../css/body.css ">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/sidebar.css">
<link rel="stylesheet" href="../css/style.css">

<link rel="icon" type="image/x-icon"
	href="../images/favicon/favicon.ico">
</head>

<body>

	<div class="container">
		<div class="head">
			<h1>
				<p>BANKERS | SeoulMeta</p>
			</h1>
			<nav>
				<ul>
					<li><a>USER</a></li>
					<li><a href="index.html">로그아웃</a></li>
				</ul>
			</nav>
		</div>
		<div class="sidebar">
			<div class="btn-group">
				<button onclick="window.location.href='vmdashboard.html'">VM
					대시보드</button>
				<button>모니터링</button>
			</div>
		</div>
		<div class="body">
			<h2>VM 정보입력</h2>
			<div class="left">
				<p>
					VM이름 : <input></input>
				</p>
				<p>
					유형 : <select>
						<option>A</option>
						<option>B</option>
						<option>C</option>
						<option>D</option>
						<option>E</option>
					</select>
				<div class="btn-group">
					<input type="button" value="취소"> <input type="button"
						value="생성">
				</div>
			</div>
			<div class="right">

				<p>=명세서=</p>
				<p>ID: sadfsadf</p>
				<p>접속 주소: sadfadfasd</p>
				<br>
				<p>=유형 A=</p>
				<p>type: mini</p>
				<p>cpu: 1개</p>
				<p>ram: 8GB</p>
				<p>storage: 20GB</p>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>BANKERS. fisabankers@gmail.com tel.010-XXXX-XXXX</p>
		<p>서울특별시 마포구 월드컵북로 434 (상암동, 상암 IT Tower 6층)</p>
	</div>
</body>
</html>