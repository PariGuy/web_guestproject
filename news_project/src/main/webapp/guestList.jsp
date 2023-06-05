<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>방명록 관리 앱</title>
</head>
<body>
<div class="container w-75 mt-5 mx-auto">
    <h2>방명록 목록</h2>
    <hr>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">작성자</th>
                <th scope="col">이메일</th>
                <th scope="col">작성일</th>
                <th scope="col">제목</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="guest" items="${guestlist}" varStatus="status">
                <tr>
                    <th scope="row">${status.count}</th>
                    <td>
                        <a href="/news_project/guest.nhn?action=getGuest&aid=${guest.aid}" class="text-decoration-none">${guest.name}</a>
                    </td>
                    <td>${guest.email}</td>
                    <td>${guest.date}</td>
                    <td>${guest.title}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <hr>
    <c:if test="${error != null}">
        <div class="alert alert-danger alert-dismissible fade show mt-3">에러 발생: ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    <button class="btn btn-outline-info mb-3" type="button" data-bs-toggle="collapse"
        data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm">등록</button>
    <div class="collapse" id="addForm">
        <div class="card card-body">
            <form method="post" action="/news_project/guest.nhn?action=addGuest" enctype="multipart/form-data">
                <label class="form-label">작성자</label>
                <input type="text" name="name" class="form-control">
                <label class="form-label">이메일</label>
                <input type="text" name="email" class="form-control">
                <label class="form-label">제목</label>
                <input type="text" name="title" class="form-control">
                <label class="form-label">내용</label>
                <textarea cols="50" rows="5" name="content" class="form-control"></textarea>
                <button type="submit" class="btn btn-success mt-3">저장</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>