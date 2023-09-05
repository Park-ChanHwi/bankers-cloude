<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BANKERS - Monitoring</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.css" rel="stylesheet">
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
                    <h1 class="h3 mb-0 text-gray-800">VM 모니터링</h1>
                    
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
                                    src="img/undraw_profile.svg">
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
                            <h6 class="m-0 font-weight-bold text-primary">VM 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="vmTable" class="table table-bordered" width="100%" cellspacing="0">
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.js"></script>

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
		
        newRow.setAttribute('id', vmname);
        
        addColumn(newRow,number);
        addColumn(newRow,vmname);
        addColumn(newRow,vmcpu);
        addColumn(newRow,vmram);
        addColumn(newRow,vmstorage);
        
        table.getElementsByTagName('tbody')[0].appendChild(newRow);
        
		if(!(vmnumber == 'PREPARING' || vmnumber == 'TOOL-OFF' || vmnumber == 'POWER-OFF')){
			 const xhttp = new XMLHttpRequest();
				xhttp.onload = function() {
				var strsplit = this.responseText.replace('@', ' ').split('_');
					
				var row = document.getElementById(strsplit[0]);
				row.getElementsByTagName("td")[2].innerText = strsplit[1];
				row.getElementsByTagName("td")[3].innerText = strsplit[2];
				row.getElementsByTagName("td")[4].innerText = strsplit[3];
			}
			
			setInterval(function() {
				xhttp.open("GET", '/vmmonitoring/'+vmnumber, true);
				xhttp.send();
			}, 2000)
		}
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
</body>
