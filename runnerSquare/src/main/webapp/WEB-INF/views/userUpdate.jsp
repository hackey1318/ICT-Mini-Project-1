<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form class="user-update-form">
		<ul>
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid" value="${id}"></li>
			<li>패스워드</li>
			<li><input type="password" name="userpwd" id="userpwd"></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username" value="${name}"/></li>
			<li>닉네임</li>
			<li><input type="text" name="userNickname" id="userNickname" value="${nickName}"/></li>
			<li>이메일</li>
			<li><input type="email" name="email" id="email" value="${email}"/></li>
			<li>연락처</li>
			<li><select name="tel1" id="tel1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="041">041</option>
					<option value="051">051</option>
					<option value="061">061</option>
				</select>
				-
				<input type="text" name="tel2" id="tel2">
				-
				<input type="text" name="tel3" id="tel3"/>
			</li>
			<li>주소</li>
			<li><input type="text" name="zipcode" id="zipcode">
				<input type="button" value="우편번호찾기" class="zipcode-btn" onclick="daumPostCodeSearch()"/>
				<input type="text" name="addr" id="addr" value="addr"/>
			</li>
			<li>상세주소</li>
			<li><input type="text" name="addrDetail" id="addrDetail"/></li>
			<li>생년월일</li>
			<li><input type="date" name="birthdate" id="birthdate"></li>
			<li>성별</li>
			<li>
				<input type="radio" name="gender" value="남"> 남
				<input type="radio" name="gender" value="여"> 여
			</li>
			<li>선호 페이스</li>
			<li>
				<select name="preferredPace" id="preferredPace" class="preferred-pace" >
					<option value="" selected>선택</option>
					<option value="4분">4분 대</option>
					<option value="5분">5분 대</option>
					<option value="6분">6분 대</option>
					<option value="7분">7분 대</option>
					<option value="8분 이상">8분 이상</option>
				</select>
			</li>
		</ul>
		<!--  <button>회원가입</button> ----- submit과 버튼 둘다 submit 이벤트 발생-->
		<input type="submit" value="회원가입" class="signin-btn"/>
	</form>