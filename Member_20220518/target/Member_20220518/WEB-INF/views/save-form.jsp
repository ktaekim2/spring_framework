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
    <style>
        input {
            display: block;
        }
    </style>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2>save-form.jsp</h2>
            <form action="save" method="post">
                <input type="text" name="memberId" placeholder="아이디">
                <input type="password" name="memberPassword" placeholder="비밀번호">
                <input type="text" name="memberName" placeholder="이름">
                <input type="text" name="memberAge" placeholder="나이">
                <input type="text" name="memberPhone" placeholder="전화번호">
                <input type="submit" value="화원가입">
                <%--    /save로 보냄--%>
                <button>버튼tag가입</button>
                <%--    이걸 사용하면 버튼으로 함수 호출기능 사용 못함--%>
                <input type="button" value="button타입">
                <%--    이걸 쓰면 submit이 안되면서 버튼을 눌러 특정 함수 호출 가능--%>
            </form>
        </div>
    </div>
</div>
</body>
</html>
