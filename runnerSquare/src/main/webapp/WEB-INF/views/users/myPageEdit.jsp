<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	#titleName {
	    width: 100%;
	    padding: 30px;
	    text-align: center;
	    font-size: 2em;
	    font-weight: bold;
	}
	.user-update-form {
		width: 70%;
		margin: 0 auto;
		display: grid;
		grid-template-columns: 1fr 4fr;
		gap: 10px;
	}
	@media(min-width: 1200px) {
		.user-update-form {
			width: 840px;
		}
	}
	@media(max-width: 700px) {
		.user-update-form {
			width: 490px;
		}
	}
	label {
		font-size: 1.2em;
		font-weight: bold;
		text-align: center;
	}
	label, input, select, form>div {
		padding: 5px;
		line-height: 30px;
	}
	input, select {
		background-color: #F0F0FF;	
	    border: none;
	    padding: 2px;
	    border-radius: 10px;
	}
	.tel>select, .tel>input {
		width: 35%;
	}
	.tel {
		display: flex;
	    justify-content: space-between;
	    gap: 10px;
	}
	.update-btn{
		width: 120px;
	    background-color:#87f23a;
	    border-radius: 30px;
	    font-size : 1em;
	    grid-column: 1 / -1;
    	justify-self: center;
	}
</style>

<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".user-update-form").addEventListener("submit", function (event) {
        event.preventDefault();

        // 폼 데이터를 FormData 객체로 추출
        const formData = new FormData(event.target);
        const tel = formData.get("tel1") + "-" + formData.get("tel2") + "-" + formData.get("tel3");
        
        const data = {
            no: formData.get("no"),
            nickName: formData.get("nickName"),
            email: formData.get("email"),
            tel: tel,
            addr: formData.get("addr"),
            preferPace: formData.get("preferPace"),
        };

        console.log(data);

        // fetch 요청 보내기
        fetch('/rs/users/myPageEditOk', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        })
        .then(response => {
        	console.log(response);
            if (response.ok) {
                alert("회원정보수정 완료");
            } else {
            	alert("회원정보수정 실패");
            	window.location.reload()
            }
        })
        .catch(error => {
            console.error("error: ", error);
        });
    });
});
</script>

<div class="main-container">
	<div id="titleName">
		개인정보 수정
	</div>
	<form class="user-update-form">
		<input type="hidden" name="no" value="${vo.no}"/>
		
		<label>아이디</label>
		<div>${vo.id}</div>
		
		<label>이름</label>
		<div>${vo.name}</div>
		
		<label>닉네임</label>
		<input type="text" name="nickName" value="${vo.nickName}"/>
		
		<label>이메일</label>
		<input type="email" name="email" value="${vo.email}"/>
		
		<label>연락처</label>
		<div class="tel">
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
		</div>
		
		
		<label>주소</label>
			<input type="text" name="addr" value="${vo.addr}"/>
			
		<label>생년월일</label>
		<div>${vo.birth}</div>
		
		<label>성별</label>
		<div><c:if test="${vo.gender == 'true'}">남</c:if><c:if test="${vo.gender == 'false'}">여</c:if></div>
		
		<label>선호 페이스</label>
		<select name="preferPace" class="preferred-pace" >
			<option value="4분" <c:if test="${vo.preferPace == '4분'}">selected</c:if>>4분 대</option>
			<option value="5분" <c:if test="${vo.preferPace == '5분'}">selected</c:if>>5분 대</option>
			<option value="6분" <c:if test="${vo.preferPace == '6분'}">selected</c:if>>6분 대</option>
			<option value="7분" <c:if test="${vo.preferPace == '7분'}">selected</c:if>>7분 대</option>
			<option value="8분 이상" <c:if test="${vo.preferPace == '8분 이상'}">selected</c:if>>8분 이상</option>
		</select>
		<input type="submit" value="회원수정" class="update-btn"/>
	</form>
	
</div>