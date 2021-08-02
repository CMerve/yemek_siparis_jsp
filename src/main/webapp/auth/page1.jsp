<!doctype html>
<% response.setContentType( "text/html; charset=utf-8" ); %>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="mubco.entity.Menu"%>
<%@page import="mubco.dao.MenuDao"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
 List<Menu> menu = new MenuDao().getMenu();
 request.setAttribute("menu", menu);
%>
<html lang="tr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Menü</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../dashboard.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

a {
	color: #737373
}

.imag {
	height: 200px;
	width: 250px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	
}
</style>


</head>
<body>

	<header class="navbar navbar-dark sticky-top flex-md-nowrap p-0 shadow"
		style="background-color: #737373">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#"><img
			style="width: 160px; height: 65px" src="../image/icon_webeat.png" /></a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link"
				href="../index.html" style="color: #bfff00">Çıkış Yap</a></li>
		</ul>
	</header>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a style="font-weight: bold;color:#bfff00" class="nav-link active table-hover"
							aria-current="page" href="page1.jsp" > <span
							 	data-feather="home"></span> Menü
						</a></li>
						<li class="nav-item"><a class="nav-link" href="page1_more.jsp" style="pointer-events: none;cursor: default;">
								<span data-feather="file"></span> Gönderim Zamanı
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="page2.jsp" style="pointer-events: none;cursor: default;"> <span
								data-feather="shopping-cart"></span> Gönderim Yeri
						</a></li>

					</ul>

					
					
					
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div style="color: #bfff00"
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Sipariş vermek istediğin ürünü seç</h1>

				</div>



				<div class="table-responsive" style="width: 100%">
					<table class="table table-striped table-sm"
						style="cursor: pointer;">
						<tr>
						<th>Ürün Görseli</th>
						<th>Ürün</th>
						<th>Açıklama</th>
						<th>Fiyat</th>
						</tr><c:forEach items="${menu}" var="urun">
						 <tr onclick="window.location='page1_more.jsp';">
						
							<td><div class="imag" id="12" style="background-image:url(${urun.urunGorsel})"></div></td>
							<td> ${urun.urunAd}</td>
						<td>	 ${urun.urunAciklama}</td>
						<td>	 ${urun.urunFiyat}</td>
							
							</br>
 						
						 </tr>
						</c:forEach>
					</table>
				</div>
				</br> </br>

			</main>
		</div>
	</div>


<script>
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {

    	
    	
        window.location = $(this).data("href");
    });
});
</script>

	<script src="../js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
	<script src="dashboard.js"></script>
</body>
</html>
