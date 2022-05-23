<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 9:45
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
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2 class="display-4 fw-normal">save.jsp</h2>
            <form action="/board/save" method="post">
                작성자<input class="form-control mb-2" type="text" id="boardWriter" name="boardWriter">
                비밀번호<input class="form-control mb-2" type="password" id="boardPassword" name="boardPassword">
                제목<input class="form-control mb-2" type="text" id="boardTitle" name="boardTitle">
                내용<textarea class="form-control" name="boardContents" id="boardContents" cols="30" rows="10"></textarea>
                <input class="btn btn-primary" type="submit" value="글쓰기">
            </form>
        </div>
    </div>
</div>
</body>
<%--<script>--%>
<%--    function abcd() {--%>
<%--        console.log("함수 호출 성공")--%>
<%--    }--%>
<%--    const duplicateCheck = () => {--%>
<%--        const memberId = document.getElementById("memberId").value;--%>
<%--        const checkResult = document.getElementById("dup-check-result");--%>
<%--        $.ajax({--%>
<%--            type: "post", // http request method--%>
<%--            url: "duplicate-check", // 요청주소(컨트롤러 주소값)--%>
<%--            data: {"memberId": memberId}, // 전송하는 파라미터--%>
<%--            dataType: "text", // 리턴받을 데이터 형식--%>
<%--            success: function (result) {--%>
<%--                if (result == "ok") {--%>
<%--                    // 사용가능한 아이디--%>
<%--                    checkResult.innerHTML = "사용가능한 아이디"--%>
<%--                    checkResult.style.color = "green"--%>
<%--                } else {--%>
<%--                    // 이미 사용중인 아이디--%>
<%--                    checkResult.innerHTML = "이미 사용중인 아이디"--%>
<%--                    checkResult.style.color = "red"--%>
<%--                }--%>
<%--            },--%>
<%--            error: function () {--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
</html>

