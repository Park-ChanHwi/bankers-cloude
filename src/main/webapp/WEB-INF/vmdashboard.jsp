<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
	<title>CSS Template</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="../css/vmdashboard.css">

	<link rel="stylesheet" href="../css/hearder.css">
	<link rel="stylesheet" href="../css/body.css ">
	<link rel="stylesheet" href="../css/footer.css">
	<link rel="stylesheet" href="../css/sidebar.css">
	<link rel="stylesheet" href="../css/style.css">

	<link rel="icon" type="image/x-icon" href="../images/favicon/favicon.ico">

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
				<button>VM 대시보드</button>
				<button onclick="window.location.href='newcustumer.html'">모니터링</button>
			</div>
		</div>
		<div class="body">
			<h2>VM 대시보드</h2>
			<div class="scroll-container">
				<table class="scrolltable">
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
						<tr>
							<td>1</td>
							<td class="vm-name">Default Value</td>
							<td>if5xp7qc</td>
							<td>on</td>
							<td>A</td>
							<td>73klqafb2b3pxhcthp6y2ufk</td>
							<td>user1</td>
							<td><input type="button" onclick="location.href='vmmanagement.html'" value="VM 관리"></td>
						</tr>
						<tr>
							<td>1</td>
							<td>VM-2</td>
							<td>if5ke2ac</td>
							<td>off</td>
							<td>B</td>
							<td>83klqafb2b3pxhcthp6y2ufk</td>
							<td>user2</td>
							<td><input type="button" onclick="location.href='vmmanagement.html'" value="VM 관리"></td>
						</tr>
						<tr>
							<td>3</td>
							<td>VM-3</td>
							<td>if5ke2ac</td>
							<td>on</td>
							<td>C</td>
							<td>53klqafb2b3pxhcthp6y2ufk</td>
							<td>user3</td>
							<td><input type="button" onclick="location.href='vmmanagement.html'" value="VM 관리"></td>
						</tr>
						<tr>
							<td>4</td>
							<td>VM-4</td>
							<td>if5ke2ac</td>
							<td>off</td>
							<td>D</td>
							<td>23klqafb2b3pxhcthp6y2ufk</td>
							<td>user4</td>
							<td><input type="button" onclick="location.href='vmmanagement.html'" value="VM 관리"></td>
						</tr>
						<tr>
							<td>5</td>
							<td>VM-5</td>
							<td>if5ke2ac</td>
							<td>off</td>
							<td>D</td>
							<td>13klqafb2b3pxhcthp6y2ufk</td>
							<td>user5</td>
							<td><input type="button" onclick="location.href='vmmanagement.html'" value="VM 관리"></td>
						</tr>
					</tbody>
				</table>
			</div>

			<input type="button" class="table-button" " onclick=" location.href='../html/vmadd.html'" value=" 추가">

		</div>

		<div class="footer">

			<p>BANKERS. fisabankers@gmail.com tel.010-XXXX-XXXX</p>

			<p>서울특별시 마포구 월드컵북로 434 (상암동, 상암 IT Tower 6층)</p>


		</div>

	</div>
</body>

</html>