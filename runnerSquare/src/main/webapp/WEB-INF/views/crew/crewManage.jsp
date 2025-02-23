<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
/* (기존 스타일 유지) */
ul {
	overflow: auto;
}

/* 테이블 스타일 추가 */
.table th, .table td {
	text-align: center; /* 텍스트 가운데 정렬 */
}

/* 제목 스타일 수정 */
#titleName {
    text-align: center;
    color: black;
    height: 10vh;
    padding-top: 2vh;
    font-size: 2em; /* 테이블 제목 크기 줄임 */
}

/* 제목 "크루리스트" 스타일 수정 */
#crewListTitle {
    width: 90%;
    margin: 0 auto;
    padding-top: 2vh;
    font-size: 1.5em; /* 테이블 제목 크기 줄임 */
}

/* 제목 "맴버리스트" 스타일 수정 */
#crewMemberListTitle {
    width: 90%;
    margin: 0 auto;
    padding-top: 2vh;
    font-size: 1.5em; /* 테이블 제목 크기 줄임 */
}

/* 맴버리스트 스타일 수정 */
#memberListUl>li {
    overflow: auto;
    padding: 10px 0px;
    line-height: 20px;
}

#memberListUl>li {
    float: left;
    border-bottom: 1px solid #ddd;
    width: 25%;
    text-align: center;
}

#memberListButton {
    padding: 0px;
    border: 0px;
}
</style>
<div class="container" style="position: relative; top: 100px;">
	<div>
		<div id="titleName">크루관리</div>

		<div class="container mt-3">
			<h2 id="crewListTitle">크루 리스트</h2>
			<table class="table">
				<thead>
					<tr>
						<th>크루명</th>
						<th>활동지역</th>
						<th>러닝요일</th>
						<th>가입일</th>
						<th>탈퇴일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody id="crewNameList">
					<!-- 크루 리스트 데이터가 여기에 동적으로 추가됨 -->
				</tbody>
			</table>
		</div>

		<div class="container mt-3">
			<h2 id="crewMemberListTitle">맴버 리스트</h2>
			<table class="table">
				<thead>
					<tr>
						<th>크루이름</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody id="crewMemberList">
					<!-- 멤버 리스트 데이터가 여기에 동적으로 추가됨 -->
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
function loadCrewNameList() {

	const params = {
		userNo: 4
	};

	const queryString = Object.keys(params).map(key => key + '=' + params[key])
			.join('&');

	console.log(queryString);
	const url = "/rs/crew/crewManage/list?" + queryString;
	console.log(url);

	fetch(url, {
		method : 'GET',
		headers : {
			'Content-Type' : 'application/json'
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
				crewListTag += "<tr>"; // 행 시작
				crewListTag += "<td>" + vo.name + "</td>";
				crewListTag += "<td>" + vo.activeArea + "</td>";
				crewListTag += "<td>" + vo.runningDay + "</td>";
				crewListTag += "<td>" + vo.createdAt + "</td>";

				if (vo.status === 'withdrawal') {
					crewListTag += "<td>" + vo.updatedAt + "</td>";
				} else {
					crewListTag += "<td></td>";
				}

				if (vo.status === 'apply') {
					crewListTag += "<td>신청대기중</td>";
				} else if (vo.status === 'approval') {
					crewListTag += "<td><button type='button' class='btn btn-outline-danger btn-sm withdrawButton'>탈퇴하기</button></td>";
				} else if (vo.status === 'withdrawal') {
					crewListTag += "<td>탈퇴한크루</td>";
				}
				crewListTag += "</tr>"; // 행 끝
			});

		} else {
			console.error("응답 데이터가 배열이 아닙니다:", data);
			crewListTag = "<tr><td>데이터를 불러올 수 없습니다.</td></tr>";
		}

		$("#crewNameList").html(crewListTag); // append 대신 html 사용

	})
	.catch(error => {
		console.error('Error:', error);
		$("#crewNameList").html("<tr><td>데이터를 불러오는 데 실패했습니다.</td></tr>");
	});
}

function loadCrewMemberList() {
	const params = {
		userNo: 4
	};

	const queryString = Object.keys(params).map(key => key + '=' + params[key])
			.join('&');

	console.log(queryString);
	const url = "/rs/crew/crewManage/memberList?" + queryString;
	console.log(url);

	fetch(url, {
		method : 'GET',
		headers : {
			'Content-Type' : 'application/json'
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
				memberListTag += "<tr>"; // 행 시작
				memberListTag += "<td>" + mvo.name + "</td>"; // 크루 이름
				memberListTag += "<td>" + mvo.nickName + "</td>"; // 닉네임
				memberListTag += "<td>" + mvo.createdAt + "</td>"; // 가입일
				
				if (mvo.status === 'apply') {
					memberListTag += "<td><button type='button' class='btn btn-outline-danger btn-sm kickButton' data-nickName='"+mvo.nickName+"'>강퇴하기</button></td>";
				} else if (mvo.status === 'approval') {
					memberListTag += "<td><button type='button' class='btn btn-success btn-sm acceptButton'>✓</button><span> </span><button type='button' class='btn btn-danger btn-sm refuseButton'>×</button></td>";
				} else if (mvo.status === 'withdrawal') {
					memberListTag += "<td>탈퇴한크루</td>";
				}
				memberListTag += "</tr>"; // 행 끝
			});
		} else {
			console.error("응답 데이터가 배열이 아닙니다:", data);
			memberListTag = "<tr><td>데이터를 불러올 수 없습니다.</td></tr>";
		}

		$("#crewMemberList").html(memberListTag); // append 대신 html 사용

		// 동적으로 생성된 버튼에 이벤트 핸들러 바인딩 (jQuery 필요)
		$(".crewListButton").on("click", function(event) {
			event.preventDefault();
			

		});
	})
	.catch(error => {
		console.error('Error:', error);
		$("#crewMemberList").html("<tr><td>데이터를 불러오는 데 실패했습니다.</td></tr>");
	});
}
//크루리스트 탈퇴
$(document).on('click', '.withdrawButton', function(event) {
    event.preventDefault();
    alert("정말로 탈퇴하시겠습니까?");
});

//맴버리스트 승인
$(document).on('click', '.acceptButton', function(event) {
    event.preventDefault();
    alert("가입을 승인합니다");
});
//맴버리스트 거부
$(document).on('click', '.refuseButton', function(event) {
    event.preventDefault();
    alert("가입을 거절합니다");
});

//맴버리스트 강퇴
$(document).on('click', '.kickButton', function(event) {
    event.preventDefault();
    const nickName = $(this).data('nickName');
    console.log("nickName:",nickName);
    alert("'" + nickName + "'님을 강퇴하시겠습니까?");
});


window.onload = function() {
	loadCrewNameList();
	loadCrewMemberList();
};
</script>