<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        function saveForm() {
            location.href = "/board/save";
        }

        function saveFileForm() {
            location.href = "/board/saveFile";
        }

        function findAll() {
            location.href = "/board/findAll";
        }

        const paging = () => {
            location.href = "/board/paging";
        }
    </script>
</head>
<body>
<h2>index.jsp</h2>
<button onclick="saveForm()">글작성</button>
<button onclick="saveFileForm()">글작성(파일)</button>
<button onclick="findAll()">글목록</button>
<button class="btn btn-outline-success" onclick="paging()">페이징목록</button>
</body>
</html>
