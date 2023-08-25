<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>CSS Template</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/vmmanagement.css">
	<link rel="stylesheet" href="../css/hearder.css">
	<link rel="stylesheet" href="../css/body.css ">
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="stylesheet" href="../css/sidebar.css">
	<link rel="stylesheet" href="../css/style.css">
	<style>
	</style>
</head>
<body>
	<div class="container">
		<div class="head">
			<h1>
				<p>BANKERS | SeoulMeta</p>
			</h1>
			<nav>
				<ul>
					<li>
						<a>USER</a>
					</li>
					<li>
						<a href="index.html">로그아웃</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="sidebar">
			<div class="btn-group">
				<button onclick="location.href='vmdashboard.html'">VM 대시보드</button>
				<button>모니터링</button>
			</div>
		</div>
		<div class="body">
			<h2 >
				VM 관리
			</h2>
			<div class="box1">
				<ul>
					<li>VM 이름 : <input type="text" /></li>
					<li>유형 : 
					<select id="catalType">
						<option>A</option>
						<option>B</option>
						<option>C</option>
						<option>D</option>
						<option>E</option>
					</select>
					</li>
					<li>ID : ziqu0obb</li>
					<li>접속 주소 : vto8bcay1o43ulb25okzundo</li>
					<li>알림 메일 : <input type="text" /></li>
					<li>CPU 사용량 알람 1 : <input type="text" /></li>
					<li>CPU 사용량 알람 2 : <input type="text" /></li>
					<li>RAM 사용량 알람 1 : <input type="text" /></li>
					<li>RAM 사용량 알람 2 : <input type="text" /></li>
					<li>Storage 사용량 알람 1 : <input type="text" /></li>
					<li>Storage 사용량 알람 2 : <input type="text" /></li>
				</ul>
			</div>
			<div class="box2">
				<ul>
					<li>=유형 A=</li>
					<li>type: mini</li>
					<li>cpu: 1개</li>
					<li>ram: 8GB</li>
					<li>storage: 200GB</li>
				</ul>
				<br>
				<div class="box3">
					<div class="box4">on</div>
					<div class="box5">off</div>
				</div>
				<p class="status">현재 on</p>
				<br>
				<br>
				<div class="box6">삭제</div>
				<div class="box6">수정</div>
			</div>
		</div>
		<div class="footer">
			<p>BANKERS. fisabankers@gmail.com tel.010-XXXX-XXXX</p>
			<p>서울특별시 마포구 월드컵북로 434 (상암동, 상암 IT Tower 6층)</p>
		</div>
	</div>
</body>
</html>