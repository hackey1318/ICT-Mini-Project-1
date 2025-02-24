<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.container{
	  	text-decoration: none;
        color: black;
	}
	.container>div {
		width: 100%;
		height: 900px;
		padding-top: 180px;
	}
	form {
		display: flex;
		justify-content: space-around;
	}
	ul{
	overflow:auto;
	}

	/*==================================*/
	/*제목: 크루관리*/
	#titleName{
		text-align: center;
        color: black;
        height: 10vh;
        padding-top:2vh;
        font-size:2em;

	}
	/*==================================*/
	/*제목 크루리스트*/
	#crewListTitle{
		width: 90%;
		margin: 0 auto;
		padding-top:2vh;
		font-size:1.5em;
	}
	/*==================================*/

	/*크루리스트 표제목*/
	#crewNameListUl>li{
		overflow : auto;
		padding : 3px 0px;
		line-height:20px;
		font-size:1.2em;
	}
	#crewNameListUl>li{
		float:left;  border-bottom:1px solid #ddd; width:16%;  text-align:center;
	}


	/*크루리스트*/
	#crewNameList, #crewMemberList{
	 height: 20vh;
	}

	#crewNameList>li, #crewMemberList>li{
		overflow : auto;
		padding : 3px 0px;
		line-height:20px;
	}
	#crewNameList>li, #crewMemberList>li{
		float:left;  border-bottom:1px solid #ddd; width:16%;  text-align:center;
	}

	#crewMemberList>li{
	width:25%;
	text-align : left;}

	#memberButtonOne{
		padding:0px;
		border:0px;
	}

	/*==================================*/
	/*제목 맴버리스트*/
	#crewMemberListTitle{
		width: 90%;
		margin: 0 auto;
		padding-top:2vh;
		font-size:2em;
	}

	/*==================================*/

	/*맴버리스트*/

	#memberListUl>li{
		overflow : auto;
		padding : 10px 0px;
		line-height:20px;
	}
	#memberListUl>li{
		float:left; border-bottom:1px solid #ddd; width:25%;  text-align:center;
	}
	#memberListButton{
		padding:0px;
		border:0px;
	}

</style>
<div class="container">
	<div>
		<div id="titleName">
			크루관리
		</div>

		<div id="crewListTitle">
			크루 리스트
		</div>

			<ul id="crewNameListUl">
				<li>크루명</li>
				<li>활동지역</li>
				<li>러닝요일</li>
				<li>가입일</li>
				<li>탈퇴일</li>
				<li>관리</li>
			</ul>
			<ul id="crewNameList">
			</ul>

		<div id="crewMemberListTitle">
			맴버 리스트
		</div>


		<ul id="memberListUl">
				<li>크루이름</li>
				<li>닉네임</li>
				<li>가입일</li>
				<li>관리</li>
		</ul>
		<ul id="crewMemberList">
		</ul>
	</div>
</div>


<script>

function loadCrewNameList() {

	const params = {
	    userNo: 4
        //페이지에 로그인정보에서 pk인 no = userNo
        /로그인 service개발완료 후 삭제 및 수정필요
    };

	const queryString = Object.keys(params)
  		.map(key => key + '=' + params[key])
  		.join('&');

	console.log(queryString);
	const url = "/rs/crew/crewManage/list?" + queryString;
	console.log(url);

	 fetch(url, {
		method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
	})
	.then(response => {
		if(!response.ok) {
			throw new Error('Network response was not ok');
		}
		return response.json();
	})
	.then(data => {
		// 성공적으로 데이터를 받아온 경우
		console.log(data);

		let crewListTag = "";

			if (Array.isArray(data)) {
		    	data.forEach(vo => {
				    crewListTag += "<li>" + vo.name + "</<li>";
				    crewListTag += "<li>" + vo.activeArea + "</li>";
				    crewListTag += "<li>" + vo.runningDay + "</li>";
				    crewListTag += "<li>" + vo.createdAt + "</li>";

					if (vo.status === 'withdrawal') {
				      crewListTag += "<li>" +vo.updatedAt + "</li>";
					}else{
						crewListTag += "<li></li>";
					}


				    if (vo.status === 'apply') {
				      crewListTag += "<li>신청대기중</li>";
				    }else if (vo.status === 'approval') {
					  crewListTag += "<li><button class='crewListButton' data-crew-id='" + vo.id + "'>탈퇴하기</button></li>";
				    }
			});

		} else {
		    console.error("응답 데이터가 배열이 아닙니다:", data);
		    crewListTag = "<li>데이터를 불러올 수 없습니다.</li>";
		}

		$("#crewNameList").append(crewListTag);

		  // 동적으로 생성된 버튼에 이벤트 핸들러 바인딩 (jQuery 필요)
		$(".crewListButton").on("click", function(event) {
		    event.preventDefault();
		    const crewId = $(this).data("crew-id");
		    console.log("탈퇴하기 버튼 클릭! Crew ID: " + crewId);

		});
	})
	.catch(error => {
		console.error('Error:', error);
		$("#crewNameList").append("<li>데이터를 불러오는 데 실패했습니다.</li>");
	});
}

window.onload = loadCrewNameList();

/////////////////////////////////////////////////////////////////////////////


function loadCrewMemberList() {
	const params = {
    	    userNo: 4
            //페이지에 로그인정보에서 pk인 no = userNo
            /로그인 service개발완료 후 삭제 및 수정필요
        };


	const queryString = Object.keys(params)
  		.map(key => key + '=' + params[key])
  		.join('&');

	console.log(queryString);
	const url = "/rs/crew/crewManage/memberList?" + queryString;
	console.log(url);

	fetch(url, {
		method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
	})
	.then(response => {
		if(!response.ok) {
			throw new Error('Network response was not ok');
		}
		return response.json();
	})
	.then(data => {
		// 성공적으로 데이터를 받아온 경우
		console.log(data);

		let memberListTag = "";

		if (Array.isArray(data)) {
	    	data.forEach(mvo => {
	    		memberListTag += "<li>" + mvo.name + "</li>";
	    		memberListTag += "<li>" + mvo.nickName + "</li>";
	    		memberListTag += "<li>" + mvo.updatedAt + "</li>";
	    		memberListTag += "<li>" + mvo.status + "</li>";


			});
		} else {
		    console.error("응답 데이터가 배열이 아닙니다:", data);
		    crewListTag = "<li>데이터를 불러올 수 없습니다.</li>";
		}

		$("#crewMemberList").append(memberListTag);

		$(".crewListButton").on("click", function(event) {
		    event.preventDefault();
		    const crewId = $(this).data("crew-id");
		    console.log("탈퇴하기 버튼 클릭! Crew ID: " + crewId);

		});
	})
	.catch(error => {
		console.error('Error:', error);
		$("#crewMemberList").append("<li>데이터를 불러오는 데 실패했습니다.</li>");
	});
}

window.onload = loadCrewMemberList();

</script>
