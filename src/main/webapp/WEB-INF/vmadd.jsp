<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>

<body>
	<div class="container">
		<div class="head">
			<h1>
				BANKERS | SeoulMeta
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
				<button onclick="location.href='/dashboard'">VM 대시보드</button>
				<button onclick="location.href='/vmmonitoring'">모니터링</button>
			</div>
		</div>
		<div class="body">
			<h2>VM 정보입력</h2>
			<div class="left">
				<form action="/vmcreate" method="post">
					<p>VM이름 : <input type="text" id="inputVMName" placeholder="vm 이름을 입력해 주세요" onkeyup="chageVMName()" name="vmname"></input></p>
					<p>유형 : </p>
						<select id="catalType" onchange="chageCatalType()" name="catalType">
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
							<option>E</option>
						</select>
					<div class="btn-group">
						<input type="button" value="취소" onclick="location.href='/dashboard'">
						<input type="submit" value="생성">
					</div>
				</form>
			</div>
			<div class="right">
				<p>=명세서=</p>
				<p id="vmname">ID: </p>
				<br>
				<p id="catalTypeInfo">
					=유형 A=<br>
					type: mini<br>
					cpu: 1개<br>
					ram: 8GB<br>
					storage: 20GB<br>
				</p>
			</div>
			<script>
				function chageVMName(){
					var vmname = document.getElementById("inputVMName").value;
					document.getElementById("vmname").innerHTML = "VM 이름: " + vmname;
				}
				function chageCatalType(){
					var catalType = document.getElementById("catalType");
					var catalTypeValue = catalType.options[catalType.selectedIndex].text;
					if(catalTypeValue == "A"){
						document.getElementById("catalTypeInfo").innerHTML = 
							"=유형 A=<br>type: mini<br>cpu: 1개<br>ram: 2GB<br>storage: 20GB<br>";
					}else if(catalTypeValue == "B"){
						document.getElementById("catalTypeInfo").innerHTML = 
							"=유형 B=<br>type: small<br>cpu: 1개<br>ram: 2GB<br>storage: 40GB<br>";
					}else if(catalTypeValue == "C"){
						document.getElementById("catalTypeInfo").innerHTML = 
							"=유형 C=<br>type: medium<br>cpu: 2개<br>ram: 4GB<br>storage: 50GB<br>";
					}else if(catalTypeValue == "D"){
						document.getElementById("catalTypeInfo").innerHTML = 
							"=유형 D=<br>type: big<br>cpu: 2개<br>ram: 8GB<br>storage: 100GB<br>";
					}else if(catalTypeValue == "E"){
						document.getElementById("catalTypeInfo").innerHTML = 
							"=유형 E=<br>type: super<br>cpu: 2개<br>ram: 16GB<br>storage: 200GB<br>";
					}
				}
			</script>
		</div>
	</div>
	<div class="footer">
		<p>BANKERS. fisabankers@gmail.com tel.010-XXXX-XXXX</p>
		<p>서울특별시 마포구 월드컵북로 434 (상암동, 상암 IT Tower 6층)</p>
	</div>
</body>
</html>