<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-18
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2>login-form.jsp</h2>
            <form action="/login" method="post">
                <input type="text" name="memberId" placeholder="아이디"><br><br>
                <input type="password" name="memberPassword" placeholder="비밀번호"><br>
                <input type="submit" value="로그인">
            </form>
        </div>
    </div>
</div>
</body>
</html>
