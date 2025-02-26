<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#body ul{
	list-style:none;
	height : 100%;
	display: flex;
	flex-direction: column;
	justify-content : space-evenly;
}
.main-container {
	width: 80%;
	margin: 0 auto;
	margin-top: 222px; /* header 높이만큼 여백 */
	margin-bottom: 34px; /* footer 높이만큼 여백 */
	height: calc(100vh - 256px); /* 화면 높이에서 header와 footer 높이를 뺀 값 */
	overflow-y: auto; /* 세로 스크롤 활성화 */
}
#titleName {
    width: 100%;
    padding-top: 1vh;
    text-align: center;
    font-size: 2em;
}
#body{
	height: 52vh;
	width:70%;
	display: flex;
	margin: 0 auto;
	
}
#left{
	height: 100%;
	width:100%;
	font-size:1.4em;
}
#left ul{
	padding-left:40%;
	width:100%
}
#right{
	height: 100%;
	width:100%
}
#right input{
 	background-color: #F0F0FF;	
    border: none;
    padding: 2px;
    border-radius: 10px;
}
#button{
    background-color:#87f23a;
    width:15%;
    padding: 20px;
    border-radius: 30px;
    font-size : 1em;
   }
 .buttonContainer{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>

<div class="main-container">
	<div id="titleName">
		개인정보 수정
	</div>
	<div id="body">
		<div id="left">
			<ul>
				<li>ID(아이디)</li>
				<li>PASSWORD</li>
				<li>PASSWORD 확인</li>
				<li>이름</li>
				<li>닉네임</li>
				<li>이메일</li>
				<li>휴대폰 번호</li>
				<li>주소</li>
				<li>생년월일</li>
				<li>성별</li>
				<li>선호페이스</li>
			</ul>
		</div>
		<div id="right">
				<ul>
				<li><input type="text" name="userid" id="userid" onkeyup="idDuplicateStatus()">
				<button type="button" class="id-check-btn" onclick="idDuplicate()">중복확인</button>
				<div><span id="idCheck"></span></div>
				<input type="hidden" id="idCheckStatus" value="N"/>
				</li>
				<li><input type="password" name="userpwd" id="userpwd"></li>
				<li><input type="password" name="pwd2" id="pwd2"/></li>
				<li><input type="text" name="username" id="username"/></li>
				<li><input type="text" name="userNickname" id="userNickname"/></li>
				<li><input type="email" name="email" id="email"/></li>
				<li><select name="tel1" id="tel1">
					<option value="" selected>선택</option>
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
				<li><input type="text" name="zipcode" id="zipcode">
				<input type="button" value="우편번호찾기" class="zipcode-btn" onclick="daumPostCodeSearch()"/>
				<input type="text" name="addr" id="addr"/>
				</li>
				<li><input type="date" name="birthdate" id="birthdate"></li>
				<li>
				<input type="radio" name="gender" value="남"> 남
				<input type="radio" name="gender" value="여"> 여
				</li>
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
		</div>
	</div>
	<div class="buttonContainer">
		<button id="button">개인정보수정</button>
	</div>
</div>