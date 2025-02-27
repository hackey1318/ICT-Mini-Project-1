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
       	font-size: 1.3em;
    	
    }
    #pwdEnterText{
    	font-size: 1.5em;
    	width: 20%
    }
    #input{
    background-color: #F0F0FF;	
    width: 100%;
    border: none;
    padding: 10px;
    border-radius: 10px;
    }
    #button{
    background-color:#87f23a;
    padding: 10px;
    border-radius: 30px;
    text-align:center;
    font-size: 1.3em;
    
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
			<form method="POST" id="formchk" onsubmit="submitForm(); return false;">
			<tr>
				<td id="pwdEnterText">ID(아이디)</td>
				<td><%= userId %></td>
			</tr>
			<tr>
				<td id="pwdEnterText">PASSWORD</td>
				<td><input type="password" id="input" placeholder="비밀번호를 입력하세요" onkeydown="if (event.keyCode == 13) { submitForm(); return false; }"></td>
			</tr>
		</table>
	</div>
	<div class="buttonContainer">
		<button type="button" id="button" onclick="submitForm()">개인정보수정</button>
	</div>
	</form>
</div>

<script>
function submitForm() {
    var userId = "<%= userId %>";
    var pwd = $("#input").val();
	<% Integer userNo = (Integer) session.getAttribute("userNo");%>
    if(pwd === null|| pwd===""){
    	alert("비밀번호를 입력하세요.");
   
    	return false;
    }
    
    var params = {
        userId: userId,
        pwd: pwd
    };
    $.ajax({
        url: '/rs/users/myPage/pwdChk',
        type: 'POST',
        data : params,
        datatype: 'json' ,
        success: function(response) {
        	console.log("response=>",<%= userNo %>);
            if (response) {
                window.location.href = "/rs/users/myPageEdit?no=<%= userNo %>";
            } else {
                alert("비밀번호가 일치하지 않습니다.");
            }
        },
        error: function(error) {
        	console.error('Error:', error);
            alert("오류가 발생했습니다.");
        }
    });
}
</script>