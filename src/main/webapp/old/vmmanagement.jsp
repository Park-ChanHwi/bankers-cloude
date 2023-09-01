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
			<h2 >
				VM 관리
			</h2>
			<form action="/vmupdate" method="get">
				<div class="box1">
					<ul>
						<li>VM 이름 : <input type="text" value="${vmname}" name="vmname"/></li>
						<li>유형 : 
							<select id="catalType" onchange="chageCatalType()" name="catalType">
							</select>
						</li>
						<li>ID : <input type="text" value="${vmid}" name="vmnumber" readonly/></li>
						<li>접속 주소 : ${vmaddress}</li>
						<li>알림 메일 : ${vmmail}</li>
						<li>CPU 사용량 알람 1 : <input type="text" value="${cpu1}" name="cpu1"/>%</li>
						<li>CPU 사용량 알람 2 : <input type="text" value="${cpu2}" name="cpu2"/>%</li>
						<li>RAM 사용량 알람 1 : <input type="text" value="${ram1}" name="ram1"/>%</li>
						<li>RAM 사용량 알람 2 : <input type="text" value="${ram2}" name="ram2"/>%</li>
						<li>Storage 사용량 알람 1 : <input type="text" value="${storage1}" name="storage1"/>%</li>
						<li>Storage 사용량 알람 2 : <input type="text" value="${storage2}" name="storage2"/>%</li>
					</ul>
				</div>
				<div class="box2">
					<p id="catalTypeInfo">
						=유형 A=<br>
						type: mini<br>
						cpu: 1개<br>
						ram: 8GB<br>
						storage: 20GB<br>
					</p>
					<br>
					<div class="box3">
						<button type="button" class="box4" onclick="vmon()">on</button>
						<button type="button" class="box5" onclick="vmoff()">off</button>
					</div>
					<p>현재 ${vmstate} <input type="text" id="state" name="state" value="NONE" readonly/></p>
					<br>
					<br>
					<button type="button" class="box6" onclick="location.href='/vmdelete/${vmid}'">삭제</button>
					<input type="submit" class="box6" value="수정">
				</div>
			</form>
			<script>
			addOpation("A");
			addOpation("B");
			addOpation("C");
			addOpation("D");
			addOpation("E");
			
			chageCatalType();
			
			function vmon(){
				document.getElementById("state").value = 'ON';
			}
			function vmoff(){
				document.getElementById("state").value = 'OFF';
			}
			
			const formtag = document.getElementById("form");
			// 데이터 전송, 페이지 전환 방지
			function handleSubmit(event) {
			  event.preventDefault();
			}
			// 등록
			function init() {
			  formtag.addEventListener('submit', handleSubmit);
			}
			
			function addOpation(option){
				var selector = document.querySelector("#catalType");
				var objOption = document.createElement("option");
				objOption.text = option;
				objOption.value = option;
				if(option == "${vmcataltype}"){
					objOption.selected = 'selected';
				}
				selector.options.add(objOption);
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
		<div class="footer">
			<p>BANKERS. fisabankers@gmail.com tel.010-XXXX-XXXX</p>
			<p>서울특별시 마포구 월드컵북로 434 (상암동, 상암 IT Tower 6층)</p>
		</div>
	</div>
</body>
</html>