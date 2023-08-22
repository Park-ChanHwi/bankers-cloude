<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/vmdashboard.css">

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
				<button>VM 대시보드</button>
				<button onclick="window.location.href=''">모니터링</button>

			</div>
		</div>
		<div class="body">
			<h2>VM 대시보드</h2>
			<div class="scroll-container">
				<table id="vmTable" class="scrolltable">
					<thead>
						<th scope="col">번호</th>
						<th scope="col">VM 이름</th>
						<th scope="col">ID</th>
						<th scope="col">상태</th>
						<th scope="col">유형</th>
						<th scope="col">접속 주소</th>
						<th scope="col">관리자</th>
						<th scope="col">버튼</th>
					</thead>
					<tbody>

					</tbody>
				</table>
				
			</div>
			<input type="button" class="table-button" " onclick=" location.href='../html/vmadd.html'" value=" 추가">
			<script>
				var aaa = "${vmname}";
				var bbb = aaa.replace(/ /g, '');
				var ccc = bbb.slice(1, -1);
				var ddd = ccc.split(',');
				
				for(var i = 0; i < ddd.length; i++){
					addRow(ddd[i]);
				}
				
				function addRow(a) {
		            var table = document.getElementById("vmTable");
		            var newRow = document.createElement("tr");

		            var cell1 = document.createElement("td");
		            cell1.textContent = "2"; // 셀 내용을 설정
		            newRow.appendChild(cell1);

		            var cell2 = document.createElement("td");
		            cell2.textContent = a; // 셀 내용을 설정
		            newRow.appendChild(cell2);

		            var cell3 = document.createElement("td");
		            cell3.textContent = "30"; // 셀 내용을 설정
		            newRow.appendChild(cell3);

		            var cell3 = document.createElement("td");
		            cell3.textContent = "30"; // 셀 내용을 설정
		            newRow.appendChild(cell3);
		            
		            var cell3 = document.createElement("td");
		            cell3.textContent = "30"; // 셀 내용을 설정
		            newRow.appendChild(cell3);
		           
		            var cell3 = document.createElement("td");
		            cell3.textContent = "30"; // 셀 내용을 설정
		            newRow.appendChild(cell3);
		            
		            var cell3 = document.createElement("td");
		            cell3.textContent = "30"; // 셀 내용을 설정
		            newRow.appendChild(cell3);
		            
		            var cell3 = document.createElement("td");
		            cell3.textContent = "30"; // 셀 내용을 설정
		            newRow.appendChild(cell3);
		            
		            table.getElementsByTagName('tbody')[0].appendChild(newRow);
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