<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
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
    padding-top: 12vh;
    text-align: center;
    font-size: 2em;
}
    #pwdEnter {
        margin-top: 20px;
        width: 100%;
      	display: flex;
      	justify-content: center;
      	align-items: center;
    }
    .table {
        width: 50%;
        margin-top: 10px;
        border : none;
    }
    .table td{
    	padding: 20px;
    	border:none;
    }
    #pwdEnterText{
    	font-size: 1.5em;
    	width: 20%
    }
    #input{
    background-color: #e0ffff;	
    width: 100%;
    border: none;
    padding: 10px;
    border-radius: 10px;
    }
    #button{
    background-color:#87f23a;
    padding: 20px;
    border-radius: 30px;
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
	<div id="pwdEnter">
		<table class ="table">
			<tr>
				<td id="pwdEnterText">ID(아이디)</td>
				<td>id들어갈 곳</td>
			</tr>
			<tr>
				<td id="pwdEnterText">PASSWORD</td>
				<td><input type="password" id="input" placeholder="비밀번호를 입력하세요"></td>
			</tr>
		</table>
	</div>
	<div class="buttonContainer">
		<button id="button">개인정보 수정하기로 이동</button>
	</div>
</div>