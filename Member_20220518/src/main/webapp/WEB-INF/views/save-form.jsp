<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-18
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="save" method="post">
    아이디: <input type="text" name="memberId">
    비밀번호: <input type="password" name="memberPassword">
    이름: <input type="text" name="memberName">
    나이: <input type="text" name="memberAge">
    전화번호: <input type="text" name="memberPhone">
    <input type="submit" value="화원가입">
</form>
</body>
</html>
