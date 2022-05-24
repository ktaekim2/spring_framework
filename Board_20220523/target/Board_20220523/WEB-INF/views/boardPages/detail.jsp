<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">
    <h2>list.jsp</h2>
    <table class="table">
        <tr>
            <td>${board.id}</td>
            <th>${board.boardTitle}</th>
        </tr>
        <tr>
            <td>${board.boardWriter}</td>
            <td>${board.boardCreatedDate}</td>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <td>${board.boardContents}</td>
        </tr>
    <tr>
        <td>
            <button class="btn btn-primary" onclick="boardDelete()">글삭제</button>
            <button class="btn btn-primary" onclick="boardUpdate()">글수정</button>
        </td>
    </tr>
    </table>
</div>
</body>
<script>
    const boardDelete = () => {
        // 비밀번호 체크를 위한 화면(passwordCheck.jsp)을 출력하고, 비밀번호 입력받아서
        // 비밀번호 일치하면 삭제처리 후 목록 출력, 일치하지 않으면 alert 띄우고 상세화면으로
        location.href='/board/passwordCheck?id=${board.id}'
    }
    const boardUpdate = () => {
        // 수정을 위한 화면(update.jsp)을 출력하고, 비밀번호를 입력받아서
        // 비밀번호 일치하면 수정처리, 일치하지 않으면 alert(회원 수정이랑 프로세스 같음)
    }
</script>
<%--<script>--%>
<%--    const detailByAjax = (id) => { // js자체가 타입 안쓰므로--%>
<%--        console.log(id);--%>
<%--        const detail = document.getElementById("detail");--%>
<%--        $.ajax({--%>
<%--            type: "get", // http request method--%>
<%--            url: "detail-ajax", // 요청주소(컨트롤러 주소값)--%>
<%--            data: {"id": id}, // 전송하는 파라미터--%>
<%--            dataType: "json", // 화면 뿌릴 때 거의 json타입으로 지정--%>
<%--            success: function (result) {--%>
<%--                let output = "<table class='table'>";--%>
<%--                output += "<tr>" +--%>
<%--                    "<th>id</th> <th>memberId</th> <th>memberPassword</th> <th>memberName</th>" +--%>
<%--                    "<th>memberAge</th> <th>memberPhone</th> " +--%>
<%--                    "</tr>";--%>
<%--                output += "<tr>";--%>
<%--                output += "<td>" + result.id + "</td>";--%>
<%--                output += "<td>" + result.memberId + "</td>";--%>
<%--                output += "<td>" + result.memberPassword + "</td>";--%>
<%--                output += "<td>" + result.memberName + "</td>";--%>
<%--                output += "<td>" + result.memberAge + "</td>";--%>
<%--                output += "<td>" + result.memberPhone + "</td>";--%>
<%--                output += "</tr>";--%>
<%--                output += "</table>";--%>

<%--                detail.innerHTML = output;--%>
<%--            },--%>
<%--            error: function () {--%>
<%--                alert("오타체크");--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
</html>
