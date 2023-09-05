<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
		<div class="head">
			<h1>
				BANKERS | SeoulMeta
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
				<button onclick="location.href='/vmmonitoring'">모니터링</button>
			</div>
		</div>
		<div class="body">
			<h2>VM 대시보드</h2>
			<div class="scroll-container">
				<table id="vmTable" class="scrolltable">
					<thead>
						<tr>
							<th>번호</th>
							<th>VM 이름</th>
							<th>상태</th>
							<th>유형</th>
							<th>접속 주소</th>
							<th>관리자</th>
							<th>버튼</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<input type="button" class="table-button" onclick="location.href='/vmadd'" value="추가">
			<script>
			
				var vmnumber = decode("${vmnumber}");
				var vmcreatedate = decode("${vmcreatedate}");
				var vmname = decode("${vmname}");
				var vmcatal = decode("${vmcatal}");
				var vmaddress = decode("${vmaddress}");
				var vmstate = decode("${vmstate}");
				var vmcustid = decode("${vmcustid}");
				
				for(var i = 0; i < vmname.length; i++){
					addRow(i+1, vmnumber[i], vmcreatedate[i], vmname[i], vmaddress[i], vmstate[i], vmcatal[i], vmcustid[i]);
				}
				
				function addRow(number, vmnumber, vmcreatedate, vmname, vmaddress, vmstate, vmcatal, vmcustid) {
		            var table = document.getElementById("vmTable");
		            var newRow = document.createElement("tr");

		            addColumn(newRow,number);
		            addColumn(newRow,vmname);
		            addColumn(newRow,vmstate);
		            addColumn(newRow,vmcatal);
		            addColumn(newRow,vmaddress);
		            addColumn(newRow,vmcustid);
		            
		            var record = document.createElement("button");
		            record.textContent = "관리하기";
		            record.className="btn";
		            newRow.appendChild(record);

		            record.onclick = function(){
		            	location.href="vmmanagement/vmnumber="+vmnumber;
		            	console.log(vmnumber + "," + vmcreatedate);
		            }
		            
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
					var strsplit = strslice.split(',');
					return strsplit;
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