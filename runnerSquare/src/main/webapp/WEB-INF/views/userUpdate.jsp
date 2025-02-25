<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".user-update-form").addEventListener("submit", function (event) {
        event.preventDefault(); // 폼 제출의 기본 동작을 막음

        // 폼 데이터를 FormData 객체로 추출
        const formData = new FormData(event.target);
        const data = {
            no: formData.get("no"), // 폼에서 no 필드를 가져옵니다. (폼에 no 필드가 있어야 함)
            pw: formData.get("pw"),
            nickName: formData.get("nickName"),
            email: formData.get("email"),
            tel1: formData.get("tel1"),
            tel2: formData.get("tel2"),
            tel3: formData.get("tel3"),
            zipcode: formData.get("zipcode"),
            addr: formData.get("addr"),
            preferPace: formData.get("preferPace"),
        };

        console.log(data);
        
        // fetch 요청 보내기
        fetch('/userUpdateOk', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data), // FormData로부터 얻은 객체를 JSON 형식으로 서버로 보냄
        })
        .then(response => {
            if (response.ok) {
                console.log('update 완료');
                // 성공 후 리다이렉트 또는 다른 처리
                window.location.href = `/userUpdate?no=${data.no}`; // 예시: 업데이트 후 리다이렉트
            } else {
                console.error("update 실패");
            }
        })
        .catch(error => {
            console.error("error: ", error);
        });
    });
});

</script>

<div class="main-container">
	<form class="user-update-form">
		<ul>
			<li><input type="hidden" name="no" value="${vo.no}"/></li>
			<li>아이디</li>
			<li>${vo.id}</li>
			<li>패스워드</li>
			<li><input type="password" name="pw"></li>
			<li>이름</li>
			<li>${vo.name}</li>
			<li>닉네임</li>
			<li><input type="text" name="nickName" value="${vo.nickName}"/></li>
			<li>이메일</li>
			<li><input type="email" name="email" value="${vo.email}"/></li>
			<li>연락처</li>
			<li>
				<select name="tel1">
					<option value="010" <c:if test="${vo.tel1 == '010'}">selected</c:if>>010</option>
				    <option value="02" <c:if test="${vo.tel1 == '02'}">selected</c:if>>02</option>
				    <option value="031" <c:if test="${vo.tel1 == '031'}">selected</c:if>>031</option>
				    <option value="041" <c:if test="${vo.tel1 == '041'}">selected</c:if>>041</option>
				    <option value="051" <c:if test="${vo.tel1 == '051'}">selected</c:if>>051</option>
				    <option value="061" <c:if test="${vo.tel1 == '061'}">selected</c:if>>061</option>
				</select>
				-
				<input type="text" name="tel2" value="${vo.tel2}">
				-
				<input type="text" name="tel3" value="${vo.tel3}"/>
			</li>
			<li>주소</li>
			<li><input type="text" name="zipcode" >
				<input type="button" value="우편번호찾기" class="zipcode-btn" onclick="daumPostCodeSearch()"/>
				<input type="text" name="addr" value="${vo.addr}"/>
			</li>
			<li>생년월일</li>
			<li>${vo.birth}</li>
			<li>성별</li>
			<li><c:if test="${vo.gender == 'true'}">남</c:if><c:if test="${vo.gender == 'false'}">여</c:if></li>
			<li>선호 페이스</li>
			<li>
				<select name="preferPace" class="preferred-pace" >
					<option value="4분" <c:if test="${vo.preferPace == '4분'}">selected</c:if>>4분 대</option>
					<option value="5분" <c:if test="${vo.preferPace == '5분'}">selected</c:if>>5분 대</option>
					<option value="6분" <c:if test="${vo.preferPace == '6분'}">selected</c:if>>6분 대</option>
					<option value="7분" <c:if test="${vo.preferPace == '7분'}">selected</c:if>>7분 대</option>
					<option value="8분 이상" <c:if test="${vo.preferPace == '8분 이상'}">selected</c:if>>8분 이상</option>
				</select>
			</li>
		</ul>
		<!--  <button>회원가입</button> ----- submit과 버튼 둘다 submit 이벤트 발생-->
		<input type="submit" value="회원수정" class="update-btn"/>
	</form>
</div>
