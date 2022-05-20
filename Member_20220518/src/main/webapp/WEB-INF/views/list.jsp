<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-19
  Time: 오전 8:41
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
</head>
<body>
<h2>list.jsp</h2>
<div class="container">
<table class="table">
    <tr>
        <th>id</th>
        <th>memberId</th>
        <th>memberPassword</th>
        <th>memberName</th>
        <th>memberAge</th>
        <th>memberPhone</th>
        <th>조회</th>
        <th>삭제</th>
    </tr>
    <c:forEach var="member" items="${memberList}">
        <tr>
            <th>${member.id}</th>
            <th>${member.memberId}</th>
            <th>${member.memberPassword}</th>
            <th>${member.memberName}</th>
            <th>${member.memberAge}</th>
            <th>${member.memberPhone}</th>
            <th><a href="/detail?id=${member.id}">조회</th>
            <th><a href="/delete?id=${member.id}">삭제</th>
<%--            클릭한 회원의 정보를 DB에서 가져와서 detail.jsp에 출력--%>
<%--            조회, 수정 삭제는 pk값을 controller에 던져야 함--%>
<%--            삭제가 완료된 전체 목록--%>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
