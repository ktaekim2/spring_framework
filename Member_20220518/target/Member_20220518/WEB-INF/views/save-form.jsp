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
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2>save-form.jsp</h2>
            <form action="save" method="post">
                아이디<input class="form-control mb-2" type="text" onblur="duplicateCheck()" id="memberId" name="memberId">
                <span id="dup-check-result"></span><br>
                비밀번호<input class="form-control mb-2" type="password" name="memberPassword">
                이름<input class="form-control mb-2" type="text" name="memberName">
                나이<input class="form-control mb-2" type="text" name="memberAge">
                전화번호<input class="form-control mb-2" type="text" name="memberPhone">
                <input class="btn btn-primary" type="submit" value="화원가입">
                <%--    /save로 보냄--%>
                <button class="btn btn-primary" onclick="location.href='/update-form'">버튼tag가입</button>
                <%--    이걸 사용하면 버튼으로 함수 호출기능 사용 못함--%>
                <input class="btn btn-primary" type="button" value="button타입" onclick="abcd()">
                <%--    이걸 쓰면 submit이 안되면서 버튼을 눌러 특정 함수 호출 가능--%>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function abcd() {
        console.log("함수 호출 성공")
    }
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post", // http request method
            url: "duplicate-check", // 요청주소(컨트롤러 주소값)
            data: {"memberId": memberId}, // 전송하는 파라미터
            dataType: "text", // 리턴받을 데이터 형식
            success: function (result) {
                if (result == "ok") {
                    // 사용가능한 아이디
                    checkResult.innerHTML = "사용가능한 아이디"
                    checkResult.style.color = "green"
                } else {
                    // 이미 사용중인 아이디
                    checkResult.innerHTML = "이미 사용중인 아이디"
                    checkResult.style.color = "red"
                }
            },
            error: function () {
            }
        });
    }
</script>
</html>
