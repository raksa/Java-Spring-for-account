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

<title>Roles</title>

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

		<c:if test="${not empty roles}">
			<table class="table table-hover">
				<tr>
					<th>id</th>
					<th>Role Name</th>
				</tr>
				<c:forEach var="role" items="${roles}">
					<tr>
						<td>${role.id}</td>
						<td><a href="role/${role.id}">${role.name}</a></td>
						<!-- TODO: implement edit -->
						<td><a class="btn btn-mini btn-primary" href="#">Edit</a></td>
						<td><a href="#" class="btn btn-mini btn-danger" role="button"
							data-toggle="modal" data-target="#confirm-delete"
							data-id="${role.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<h2>
			<a class="btn btn-primary" href="role/add">Add</a>
		</h2>

	</div>
	<!-- /container -->
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">Confirm Delete</div>
				<div class="modal-body">
					Delete role with id <span class="des-id"></span>?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<a class="btn btn-danger btn-ok">Delete</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		$("#confirm-delete").on("show.bs.modal", function(e) {
			var id = $(e.relatedTarget).data('id');
			$(this).find('.des-id').text(id);
			$(this).find('.btn-ok').data('id', id);
		});
		$('#confirm-delete').on('click', '.btn-ok', function(e) {
			var $modalDiv = $(e.delegateTarget);
			var id = $(this).data('id');
			$modalDiv.addClass('loading');
			$.ajax({
				method : "POST",
				contentType : "application/json",
				url : "role/delete",
				data : JSON.stringify({
					id : Number(id)
				}),
				dataType : 'json',
				timeout : 100000,
			}).done(function(msg) {
				$modalDiv.modal('hide').removeClass('loading');
				alert("Return message=> code:" + msg.code + ", msg:" + msg.msg);
			}).fail(function(msg) {
				$modalDiv.modal('hide').removeClass('loading');
				alert("Return message=> fail");
			});
		});
	</script>
</body>
</html>
