<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>list.jsp</h2>
    <table class="table">
        <tr>
            <td>번호 | ${board.id}</td>
            <th>제목 | ${board.boardTitle}</th>
        </tr>
        <tr>
            <td>작성자 | ${board.boardWriter}</td>
            <td>작성시간 | ${board.boardCreatedDate}</td>
            <td>조회수 | ${board.boardHits}</td>
        </tr>
        <tr>
            <td><img src="${pageContext.request.contextPath}/upload/${board.boardFileName}" alt="" height="200"
                     width="200"><br>
                ${board.boardContents}</td>
        </tr>
    </table>
    <button class="btn btn-primary" onclick="boardDelete()">글삭제</button>
    <button class="btn btn-primary" onclick="boardUpdate()">글수정</button>
    <button class="btn btn-primary" onclick="paging()">페이징목록</button>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    const boardDelete = () => {
        // 비밀번호 체크를 위한 화면(passwordCheck.jsp)을 출력하고, 비밀번호 입력받아서
        // 비밀번호 일치하면 삭제처리 후 목록 출력, 일치하지 않으면 alert 띄우고 상세화면으로
        location.href = '/board/passwordCheck?id=${board.id}'
    }
    const boardUpdate = () => {
        // 수정을 위한 화면(update.jsp)을 출력하고, 비밀번호를 입력받아서
        // 비밀번호 일치하면 수정처리, 일치하지 않으면 alert(회원 수정이랑 프로세스 같음)
        location.href = '/board/update?id=${board.id}'
    }
    const paging = () => {
        location.href = '/board/paging?page=${page}'; // 직전에 있었던 페이지 값을 컨트롤러로 요청
    }
</script>
</html>
