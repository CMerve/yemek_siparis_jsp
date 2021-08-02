<!doctype html>
<% response.setContentType( "text/html; charset=utf-8" ); %>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>

<html lang="tr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Gönderim Yeri</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../dashboard.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="https://js.api.here.com/v3/3.1/mapsjs-ui.css" />
 <script type="text/javascript" src="https://js.api.here.com/v3/3.1/mapsjs-core.js"></script>
    <script type="text/javascript" src="https://js.api.here.com/v3/3.1/mapsjs-service.js"></script>
    <script type="text/javascript" src="https://js.api.here.com/v3/3.1/mapsjs-ui.js"></script>
    <script type="text/javascript" src="https://js.api.here.com/v3/3.1/mapsjs-mapevents.js"></script>
  <script>window.ENV_VARIABLE = 'developer.here.com'</script><script src='../iframeheight.js'></script>
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

	#sidebar {
  flex-basis: 15rem;
  flex-grow: 1;
  padding: 1rem;
  max-width: 30rem;
  height: 100%;
  box-sizing: border-box;
  overflow: auto;
}

#map {
  flex-basis: 0;
  flex-grow: 4;
  height: 100%;
}
	
</style>


</head>
<body onload="initialize();">

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
						<li class="nav-item"><a style="color:#bfff00" class="nav-link active table-hover"
							aria-current="page" href="page1.jsp" > <span
							 	data-feather="home"></span> Menü
						</a></li>
						<li class="nav-item"><a style="color:#bfff00" class="nav-link" href="page1_more.jsp" >
								<span data-feather="file"></span> Gönderim Zamanı
						</a></li>
						<li class="nav-item"><a style="font-weight: bold;color:#bfff00" class="nav-link"
							href="page2.jsp" > <span
								data-feather="shopping-cart"></span> Gönderim Yeri
						</a></li>

					</ul>

					
					
					
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div style="color: #bfff00"
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Gönderim yerini seç</h1>

				</div>


				
   <div id="harita" ></div></br>
    <a class="w-100 h-40 btn btn-lg "  style="background-color:#bfff00 ;color:white" href="./end.jsp" >Siparişi Tamamla</a>
    
<script src="https://maps.google.com/maps/api/js"></script>
<script>
  function konumuGetir() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(konumuGoster, hataGoster);
    } else {
      document.write("Tarayıcınız Geolocation API desteklemiyor.");
    }
  }

  function konumuGoster(konum) {
    enlem = konum.coords.latitude;
    boylam = konum.coords.longitude;
    latlon = new google.maps.LatLng(enlem, boylam)
    harita = document.getElementById('harita')
    harita.style.height = '500px';
    harita.style.width = '100%';

    var secenekler = {
      center: latlon, zoom: 14,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false,
      navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL }
    }

    var map = new google.maps.Map(harita, secenekler);
    var marker = new google.maps.Marker({ 
        draggable: true,
        animation: google.maps.Animation.DROP, position: latlon, map: map, title: "Buradasınız!" });
    marker.addListener("click", toggleBounce);
  }
  function toggleBounce() {
	    if (marker.getAnimation() !== null) {
	      marker.setAnimation(null);
	    } else {
	      marker.setAnimation(google.maps.Animation.BOUNCE);
	    }
	  }
  function hataGoster(hata) {
    document.write(hata.message);
  }

  konumuGetir();
  
 
</script>      
    
				</br> </br>

			</main>
		</div>
	</div>


</body>
</html>
