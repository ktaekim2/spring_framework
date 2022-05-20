<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-20
  Time: 오전 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>회원정보 수정</title>
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
      <h2>update.jsp</h2>
      <form action="/update" method="post" name="updateForm">
        회원번호<input class="form-control mb-2" type="text" name="id" value="${updateMember.id}" readonly>
        아이디<input class="form-control mb-2" type="text" name="memberId" value="${updateMember.memberId}"  readonly>
        비밀번호<input class="form-control mb-2" type="password" name="memberPassword" id="pwConfirm" placeholder="비밀번호를 입력하세요">
        이름<input class="form-control mb-2" type="text" name="memberName" value="${updateMember.memberName}"  readonly>
        나이<input class="form-control mb-2" type="text" name="memberAge" value="${updateMember.memberAge}" readonly>
        전화번호<input class="form-control mb-2" type="text" name="memberPhone" value="${updateMember.memberPhone}">
        <input class="btn btn-primary" type="button" onclick="update()" value="정보수정">
      </form>
    </div>
  </div>
</div>
</body>
<script>
  const update = () => {
    console.log("update 함수호출")
    // 사용자가 입력한 비밀번호 값 가져오기
    const pwConfirm = document.getElementById("pwConfirm").value;
    // DB에서 가져온 비밀번호 가져오기
    const pwDB = '${updateMember.memberPassword}';
    console.log("pwConfirm: " + pwConfirm + ", pwDB: " + pwDB);
    // 비밀번호 일치하면 form태그에 입력한 내용을 컨트롤러로 요청
    // 일치하지 않으면 alert으로 비밀번호 틀린다고 보여줌
    if (pwConfirm == pwDB) {
      updateForm.submit(); // 해당 폼을 submit 하는 js 함수
    } else {
      alert("비밀번호가 틀립니다.")
    }
  }
</script>
</html>
