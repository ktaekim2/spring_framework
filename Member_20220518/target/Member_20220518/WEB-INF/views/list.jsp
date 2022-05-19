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
</head>
<body>
<h2>list.jsp</h2>
<c:forEach var="member" items="${memberList}">
    <%--    var: 반복변수, items: 반복할 대상--%>
    아이디: ${member.memberId}
    비밀번호: ${member.memberPassword}
    이름: ${member.memberName}
    나이: ${member.memberAge}
    전화번호: ${member.memberPhone}<br>
</c:forEach>
</body>
</html>
