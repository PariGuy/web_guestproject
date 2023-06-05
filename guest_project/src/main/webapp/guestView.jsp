<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 관리 앱</title>
</head>
<body>
	<div class="container w-75 mt-5 mx-auto">
	<h2>${guest.title}</h2>
	<hr>
	<table class="table">
		<tbody>
			<tr>
				<th>Name:</th>
				<td>${guest.name}</td>
			</tr>
			<tr>
				<th>Email:</th>
				<td>${guest.email}</td>
			</tr>
			<tr>
				<th>Date:</th>
				<td>${guest.date}</td>
			</tr>
			<tr>
				<th>Title:</th>
				<td>${guest.title}</td>
			</tr>
		</tbody>
	</table>
	<hr>
	<h4>Content:</h4>
	<p>${guest.content}</p>
	<a href="javascript:history.back()" class="btn btn-primary"> << Back </a>
	</div>
</body>
</html>