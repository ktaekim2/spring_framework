<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-24
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글수정</title>
    <style>
        input {
            display: block;
        }
    </style>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2>update.jsp</h2>
            <form action="/board/update" method="post" name="updateForm">
                회원번호<input class="form-control mb-2" type="text" name="id" value="${board.id}" readonly>
                작성자<input class="form-control mb-2" type="text" name="boardWriter" value="${board.boardWriter}"
                          readonly>
                비밀번호<input class="form-control mb-2" type="text" name="boardPassword" id="boardPassword"
                           placeholder="비밀번호를 입력하세요">
                제목<input class="form-control mb-2" type="text" name="boardTitle" value="${board.boardTitle}">
                내용<textarea class="form-control" name="boardContents" id="boardContents" cols="30"
                            rows="10">${board.boardContents}</textarea><br>
                <input class="btn btn-primary" type="button" onclick="update()" value="정보수정">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    const update = () => {
        console.log("update 함수호출")
        const boardPassword = document.getElementById("boardPassword").value;
        const pwDB = '${board.boardPassword}';
        console.log("boardPassword: " + boardPassword + ", pwDB: " + pwDB);
        if (boardPassword == pwDB) {
            updateForm.submit();
        } else {
            alert("비밀번호가 틀립니다.")
            location.href = "/board/detail?id=${board.id}";
        }
    }
</script>
</html>
