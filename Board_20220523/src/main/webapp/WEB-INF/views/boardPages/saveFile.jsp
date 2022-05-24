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
            <form action="/board/saveFile" method="post" enctype="multipart/form-data">
                <%--                enctype: 파일 보낸다는 의미--%>
                작성자<input class="form-control mb-2" type="text" id="boardWriter" name="boardWriter">
                비밀번호<input class="form-control mb-2" type="password" id="boardPassword" name="boardPassword">
                제목<input class="form-control mb-2" type="text" id="boardTitle" name="boardTitle">
                내용<textarea class="form-control" name="boardContents" id="boardContents" cols="30" rows="10"></textarea><br>
                첨부파일<input type="file" name="boardFile"><br>
<%--                    db에는 파일의 name이 저장되는 것. 파일 자체가 db에 가는것 아님.--%>
                <input class="btn btn-primary" type="submit" value="글쓰기">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>

