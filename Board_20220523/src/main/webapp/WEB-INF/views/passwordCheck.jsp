<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 11:20
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
            <h2>passwordCheck.jsp</h2>
            <form action="/passwordCheck" method="post">
                <input type="password" name="boardPassword" placeholder="비밀번호"><br>
                <input type="submit" value="확인">
            </form>
        </div>
    </div>
</div>
</body>
</html>
