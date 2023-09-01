<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>CSS Template</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/vmmonitoringdashboard.css">
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
				<button>모니터링</button>
			</div>
		</div>
		<div class="body">
			<h2>모니터링</h2>
			<div class="scroll-container">
				<table id="vmTable" class="scrolltable">
					<thead>
						<tr>
							<th>번호</th>
							<th>VM 이름</th>
							<th>CPU %</th>
							<th>RAM %, GB</th>
							<th>Storage %, GB</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<script>
			
				var vmnumber = decode("${vmnumber}");
				var vmname = decode("${vmname}");
				var vmcpu = decode("${vmcpu}");
				var vmram = decode("${vmram}");
				var vmstorage = decode("${vmstorage}");
				
				for(var i = 0; i < vmname.length; i++){
					addRow(i+1, vmnumber[i], vmname[i], vmcpu[i], vmram[i], vmstorage[i]);
				}
				
				function addRow(number, vmnumber, vmname, vmcpu, vmram, vmstorage) {
		            var table = document.getElementById("vmTable");
		            var newRow = document.createElement("tr");

		            addColumn(newRow,number);
		            addColumn(newRow,vmname);
		            addColumn(newRow,vmcpu);
		            addColumn(newRow,vmram);
		            addColumn(newRow,vmstorage);
		            
		            table.getElementsByTagName('tbody')[0].appendChild(newRow);
		        }
				
				function addColumn(row, str){
					var cell = document.createElement("td");
		            cell.textContent = str;
		            row.appendChild(cell);
				}
				
				function decode(str){
					var strtrim = str.replace(/ /g, '');
					var strslice = strtrim.slice(1, -1);
					var addspace = strslice.replace('@', ' ');
					var strsplit = addspace.split(',');
					return strsplit;
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