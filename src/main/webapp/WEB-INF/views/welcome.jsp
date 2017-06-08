<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- ... -->

<title>Welcome</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container">

		<div>
			<spring:message code="label.toLocale" var="toLocale"></spring:message>
			<h3>
				<spring:message code="label.to" />
				<a href="?locale=${toLocale}" class="btn btn-success">${toLocale.toUpperCase()}</a>
			</h3>
		</div>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>

			<h2>
				<spring:message code="label.welcome" />
				${pageContext.request.userPrincipal.name} | <a
					onclick="document.forms['logoutForm'].submit()">Logout</a>
			</h2>

			<h2>
				<a class="btn btn-default" href="roles">Roles</a>
			</h2>

		</c:if>

		<br>
		<div>
			<h2>Test Restful API</h2>
			<button id="test-get" type="button" class="btn btn-primary btn-lg">greeting
				[GET]</button>
			<button id="test-post" type="button" class="btn btn-success btn-lg">get user by ID(1) 
				[POST]</button>
			<button id="send-mail" type="button" class="btn btn-warning btn-lg">invoke send mail
				[POST]</button>
		</div>
		<script>
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});
			function alertMsg(url, msg, isError) {
				alert((isError ? "Error!! " : "") + "Url: " + url
						+ ", Data Back: " + JSON.stringify(msg));
			}
			$(document).ready(function() {
				$("#test-get").click(function() {
					var url = "rest-api/greeting";
					$.ajax({
						method : "GET",
						url : url
					}).done(function(msg) {
						alertMsg(url, msg);
					});
				});
				$("#test-post").click(function() {
					var url = "rest-api/get-user";
					$.ajax({
						method : "POST",
						contentType : "application/json",
						url : url,
						data : JSON.stringify({
							id : 1
						}),
						dataType : 'json',
						timeout : 100000,
					}).done(function(msg) {
						alertMsg(url, msg);
					});
				});
				$("#send-mail").click(function() {
					var url = "rest-api/send-mail";
					$.ajax({
						method : "POST",
						contentType : "application/json",
						url : url,
						data : JSON.stringify({
							message : "Rest with POST to send mail success!"
						}),
						dataType : 'json',
						timeout : 100000,
					}).done(function(msg) {
						alertMsg(url, msg);
					}).fail(function(msg) {
						alertMsg(url, msg, true);
					});
				});
			});
		</script>

	</div>
	<!-- /container -->
</body>
</html>
