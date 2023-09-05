<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BANKERS - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.css" rel="stylesheet">
    
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-left-image sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/dashboard">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Bankers</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/dashboard">
                    <i class="fas fa-fw fa-tablet-alt"></i>
                    <span>대시보드</span></a>
            </li>

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/vmmonitoring">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>모니터링</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Page Heading -->
                    <h1 class="h3 mb-0 text-gray-800">VM 정보</h1>
                    
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${id}</span>
                                <img class="img-profile rounded-circle"
                                    src="/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" id="monitorname">모니터</h6>
                        </div>
                        <div class="card-body">
	                        <table>
							    <tr>
							        <td style="width:40%" valign="top" id='infotext'>
							        	VM 이름 : <br>
									</td>
							        <td>
	   									<div id="curve_chart" style="width: 400px; height: 200px"></div>
									</td>
							    </tr>
							</table>
	                        <div class="table-responsive">
	                        	<table id="vmlog" class="table table-bordered" width="100%" cellspacing="0">
	                        		<thead>
	                        			<tr>
	                              			<th>번호</th>	
											<th>VM 이름</th>
											<th>유형</th>
											<th>상태</th>
											<th>주소</th>
											<th>생성 날짜</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->
			
            <!-- Footer -->
            <footer class="sticky-footer bg-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>BANKERS. bankersfisa@gmail.com tel.010-XXXX-XXXX</span><br>
                        <span>서울특별시 마포구 월드컵북로 434 (상암동, 상암 IT Tower 6층)</span><br>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">"로그아웃" 버튼을 선택하시면 현재 세션이 종료됩니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="/">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.js"></script>
    
    <script>
    
	var createdate = decode("${createdate}");
	var vmname = decode("${vmname}");
	var vmcatal = decode("${vmcatal}");
	var vmaddress = decode("${vmaddress}");
	var vmstate = decode("${vmstate}");
    
    var monitorname = document.getElementById("monitorname");
    monitorname.innerHTML = vmname[vmname.length - 1] + ' 모니터';
	
    for(var i = vmname.length - 1; i >= 0; i--){
		addRow(vmname.length - i, createdate[i], vmname[i], vmcatal[i], vmstate[i], vmaddress[i]);
	}
	
	function addRow(number, createdate, vmname, vmcatal, vmstate, vmaddress) {
        var table = document.getElementById("vmlog");
        var newRow = document.createElement("tr");
		
        addColumn(newRow,number);
        addColumn(newRow,vmname);
        addColumn(newRow,vmcatal);
        addColumn(newRow,vmstate);
        addColumn(newRow,vmaddress);
        addColumn(newRow,createdate);
        
        table.getElementsByTagName('tbody')[0].appendChild(newRow);
    }
	
    var infotext = document.getElementById("infotext");
    infotext.innerHTML = 'VM 이름 : ' + vmname[vmname.length - 1] + '<br>';
    infotext.innerHTML += 'ID : ' + ${vmnumber} + '<br>';
    infotext.innerHTML += '접속 주소 : ' + vmaddress[vmaddress.length - 1] + '<br>';
    
    var catal = vmcatal[vmcatal.length - 1];
    
    if (catal == "A") {
    	infotext.innerHTML += "=유형 A=<br>type: mini<br>cpu: 1개<br>ram: 2GB<br>storage: 20GB<br>";
	} else if (catal == "B") {
		infotext.innerHTML += "=유형 B=<br>type: small<br>cpu: 1개<br>ram: 2GB<br>storage: 40GB<br>";
	} else if (catal == "C") {
		infotext.innerHTML += "=유형 C=<br>type: medium<br>cpu: 2개<br>ram: 4GB<br>storage: 50GB<br>";
	} else if (catal == "D") {
		infotext.innerHTML += "=유형 D=<br>type: big<br>cpu: 2개<br>ram: 8GB<br>storage: 100GB<br>";
	} else if (catal == "E") {
		infotext.innerHTML += "=유형 E=<br>type: super<br>cpu: 2개<br>ram: 16GB<br>storage: 200GB<br>";
	}
    
	function addColumn(row, str){
		var cell = document.createElement("td");
        cell.textContent = str;
        row.appendChild(cell);
	}
    
    function decode(str){
    	var strsplit = str.split('_');
		return strsplit;
    }
    </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      
      var cpu1 = 0;
      var cpu2 = 0;
      var cpu3 = 0;
      var cpu4 = 0;
      var cpu5 = 0;
      var cpu6 = 0;
      var cpu7 = 0;
      var cpu8 = 0;
      var cpu9 = 0;
      var cpu10 = 0;
      
      var ram1 = 0;
      var ram2 = 0;
      var ram3 = 0;
      var ram4 = 0;
      var ram5 = 0;
      var ram6 = 0;
      var ram7 = 0;
      var ram8 = 0;
      var ram9 = 0;
      var ram10 = 0;
      
      var storage1 = 0;
      var storage2 = 0;
      var storage3 = 0;
      var storage4 = 0;
      var storage5 = 0;
      var storage6 = 0;
      var storage7 = 0;
      var storage8 = 0;
      var storage9 = 0;
      var storage10 = 0;
      
      function drawChart() {
          	const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				console.log('RESPONSE : ' + this.responseText);
				
				var strsplit = this.responseText.split('_');
				
				cpu1 = cpu2;
				cpu2 = cpu3;
				cpu3 = cpu4;
				cpu4 = cpu5;
				cpu5 = cpu6;
				cpu6 = cpu7;
				cpu7 = cpu8;
				cpu8 = cpu9;
				cpu9 = cpu10;
				cpu10 = Number(strsplit[1].split('%')[0]);
				
				ram1 = ram2;
				ram2 = ram3;
				ram3 = ram4;
				ram4 = ram5;
				ram5 = ram6;
				ram6 = ram7;
				ram7 = ram8;
				ram8 = ram9;
				ram9 = ram10;
				ram10 = Number(strsplit[2].split('@')[0].split('%')[0]);
				
				storage1 = storage2;
				storage2 = storage3;
				storage3 = storage4;
				storage4 = storage5;
				storage5 = storage6;
				storage6 = storage7;
				storage7 = storage8;
				storage8 = storage9;
				storage9 = storage10;
				storage10 = Number(strsplit[3].split('@')[0].split('%')[0]);
				
				var data = google.visualization.arrayToDataTable([
		            ['USED', 'CPU', 'RAM', 'STORAGE'],
		            ['1',  cpu1,  ram1,  storage1],
		            ['2',  cpu2,  ram2,  storage2],
		            ['3',  cpu3,  ram3,  storage3],
		            ['4',  cpu4,  ram4,  storage4],
		            ['5',  cpu5,  ram5,  storage5],
		            ['6',  cpu6,  ram6,  storage6],
		            ['7',  cpu7,  ram7,  storage7],
		            ['8',  cpu8,  ram8,  storage8],
		            ['9',  cpu9,  ram9,  storage9],
		            ['10',  cpu10,  ram10,  storage10]
		          ]);

				 var options = {
					        chart: {
					          title: 'Box Office Earnings in First Two Weeks of Opening',
					          subtitle: 'in millions of dollars (USD)'
					        }
					      };

		          var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

		          chart.draw(data, options);
				
			}
			
			setInterval(function() {
				xhttp.open("GET", '/vmmonitoring/'+${vmnumber}, true);
				xhttp.send();
			}, 2000)
        }
      
    </script>
</body>
</html>