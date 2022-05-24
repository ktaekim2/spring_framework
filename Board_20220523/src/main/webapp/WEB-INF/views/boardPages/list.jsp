<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--jsp에서 지원하는 형식을 맞출 때 사용하는 라이브러리--%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>list.jsp</h2>
    <table class="table">
        <tr>
            <th>id</th>
            <th>boardTitle</th>
            <th>boardWriter</th>
            <th>boardHits</th>
            <th>boardCreatedDate</th>
        </tr>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.id}</td>
                <td><a href="/board/detail?id=${board.id}">${board.boardTitle}</a></td>
                <td>${board.boardWriter}</td>
                <td>${board.boardHits}</td>
                <td><fmt:formatDate pattern="MM-dd hh:mm" value="${board.boardCreatedDate}"></fmt:formatDate> </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
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

