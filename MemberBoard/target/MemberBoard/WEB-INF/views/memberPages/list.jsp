<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2>list.jsp</h2>
<div class="container">
    <table class="table">
        <tr>
            <th>id</th>
            <th>memberId</th>
            <th>memberPassword</th>
            <th>memberName</th>
            <th>memberEmail</th>
            <th>memberMobile</th>
            <th>memberProfile</th>
            <th>삭제</th>
        </tr>
        <c:forEach var="member" items="${memberList}">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberMobile}</td>
                <td><img src="${pageContext.request.contextPath}/upload/${member.memberProfile}"
                         alt="${member.memberProfile}" height="100" width="100"></td>
                <td><a href="/member/delete?id=${member.id}">삭제</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
