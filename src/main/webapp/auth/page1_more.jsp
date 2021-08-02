<!doctype html>
<% response.setContentType( "text/html; charset=utf-8" ); %>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>

<html lang="tr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Gönderim Zamanı</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../dashboard.css" rel="stylesheet">
 <link rel="stylesheet" href="../css/style.css">
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


body {font-family: Verdana, sans-serif;
  color: #aaa;}

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
						<li class="nav-item"><a style="color:#bfff00" class="nav-link active table-hover"
							aria-current="page" href="page1.jsp" > <span
							 	data-feather="home"></span> Menü
						</a></li>
						<li class="nav-item"><a style="font-weight: bold;color:#bfff00" class="nav-link" href="page1_more.jsp">
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
					<h1 class="h2">Gönderim saatini seç</h1>

				</div>
				<form action="page2.jsp">
			<div class="app-container" ng-app="dateTimeApp" ng-controller="dateTimeCtrl as ctrl" ng-cloak>
		
	<div date-picker
		 datepicker-title="Teslimat zamanını seçin"
		 picktime="true"
		 pickdate="true"
		 pickpast="false"
		 mondayfirst="false"
		 custom-message="Seçtiniz"
		 selecteddate="ctrl.selected_date"
		 updatefn="ctrl.updateDate(newdate)">
	
		<div class="datepicker"
			 ng-class="{
				'am': timeframe == 'am',
				'pm': timeframe == 'pm',
				'compact': compact
			}">
			<div class="datepicker-header">
				<div class="datepicker-title" ng-if="datepicker_title">{{ datepickerTitle }}</div>
				<div class="datepicker-subheader">{{ customMessage }} {{ selectedDay }} {{ monthNames[localdate.getMonth()] }} {{ localdate.getDate() }}, {{ localdate.getFullYear() }}</div>
			</div>
			<div class="datepicker-calendar">
				<div class="calendar-header">
					<div class="goback" ng-click="moveBack()" ng-if="pickdate">
						<svg width="30" height="30">
							<path fill="none" stroke="#00FFFF" stroke-width="3" d="M19,6 l-9,9 l9,9"/>
						</svg>
					</div>
					<div class="current-month-container">{{ currentViewDate.getFullYear() }} {{ currentMonthName() }}</div>
					<div class="goforward" ng-click="moveForward()" ng-if="pickdate">
						<svg width="30" height="30">
							<path fill="none" stroke="#00FFFF" stroke-width="3" d="M11,6 l9,9 l-9,9" />
						</svg>
					</div>
				</div>
				<div class="calendar-day-header">
					<span ng-repeat="day in days" class="day-label">{{ day.short }}</span>
				</div>
				<div class="calendar-grid" ng-class="{false: 'no-hover'}[pickdate]">
					<div
						ng-class="{'no-hover': !day.showday}"
						ng-repeat="day in month"
						class="datecontainer"
						ng-style="{'margin-left': calcOffset(day, $index)}"
						track by $index>
						<div class="datenumber" ng-class="{'day-selected': day.selected }" ng-click="selectDate(day)">
							{{ day.daydate }}
						</div>
					</div>
				</div>
			</div>
			<div class="timepicker" ng-if="picktime == 'true'">
				<div ng-class="{'am': timeframe == 'am', 'pm': timeframe == 'pm' }">
					<div class="timepicker-container-outer" selectedtime="time" timetravel>
						<div class="timepicker-container-inner">
							<div class="timeline-container" ng-mousedown="timeSelectStart($event)" sm-touchstart="timeSelectStart($event)">
								<div class="current-time">
									<div class="actual-time">{{ time }}</div>
								</div>
								<div class="timeline">
								</div>
								<div class="hours-container">
									<div class="hour-mark" ng-repeat="hour in getHours() track by $index"></div>
								</div>
							</div>
							<div class="display-time">
								<div class="decrement-time" ng-click="adjustTime('decrease')">
									<svg width="24" height="24">
										<path stroke="white" stroke-width="2" d="M8,12 h8"/>
									</svg>
								</div>
								<div class="time" ng-class="{'time-active': edittime.active}">
									<input type="text" class="time-input" ng-model="edittime.input" ng-keydown="changeInputTime($event)" ng-focus="edittime.active = true; edittime.digits = [];" ng-blur="edittime.active = false"/>
									<div class="formatted-time">{{ edittime.formatted }}</div>
								</div>
								<div class="increment-time" ng-click="adjustTime('increase')">
									<svg width="24" height="24">
										<path stroke="white" stroke-width="2" d="M12,7 v10 M7,12 h10"/>
									</svg>
								</div>
							</div>
							<div class="am-pm-container">
								<div class="am-pm-button" ng-click="changetime('am');">am</div>
								<div class="am-pm-button" ng-click="changetime('pm');">pm</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="buttons-container">
				
				<div ><input class="save-button" type="submit" value="Tarih ve Saati onayla" ></div>
			</div>
			
		</div></form>
	</div>
</div>
			</main>
		</div>
	</div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular.min.js'></script>

    <script src="../js/index.js"></script>
</body>
</html>
