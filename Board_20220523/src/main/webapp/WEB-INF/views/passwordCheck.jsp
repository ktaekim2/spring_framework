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
            <input type="text" id="inputPassword" name="inputPassword" placeholder="비밀번호"><br>
            <input class="btn btn-primary" type="button" onclick="passwordCheck()" value="비밀번호확인">
        </div>
    </div>
</div>
</body>
<script>
    const passwordCheck = () => {
        console.log("passwordCheck 함수호출")
        const inputPassword = document.getElementById("inputPassword").value;
        const boardPasswordDB = '${board.boardPassword}';
        console.log("inputPassword: " + inputPassword + ", boardPasswordDB: " + boardPasswordDB);
        if (inputPassword == boardPasswordDB) {
            location.href = "/board/delete?id=${board.id}"
        } else {
            alert("비밀번호 불일치")
            location.href = "/board/detail?id=${board.id}"
        }
    }
</script>
</html>
