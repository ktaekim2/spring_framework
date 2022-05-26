<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        input {
            display: block;
        }
    </style>
</head>
<body>
<h2>login.jsp</h2>
<form action="/member/login" method="post">
    아이디<input type="text" name="loginId">
    비밀번호<input type="password" name="loginPassword">
    로그인<input type="submit">
</form>
</body>
</html>
