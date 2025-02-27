<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="sideBar.jsp"%>

<% String userRole = (String) session.getAttribute("userRole"); %>
<% Integer userNo = (Integer) session.getAttribute("userNo"); %>
<% String userNickName2 = (String) session.getAttribute("userNickName"); %>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/citySelect.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewCreate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewUpdate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewJoin.js"></script>
<link href="${pageContext.request.contextPath}/resources/crewCreate.css" rel="stylesheet" type="text/css"/>

<style>

.main-container {
   width: 80%;
   margin: 0 auto;
   margin-top: 222px; /* header 높이만큼 여백 */
   margin-bottom: 34px; /* footer 높이만큼 여백 */
   height: calc(100vh - 256px); /* 화면 높이에서 header와 footer 높이를 뺀 값 */
   overflow-y: auto; /* 세로 스크롤 활성화 */
}
/* 테이블 스타일  */
.table th,
.table td {
    text-align: center;
}

/* 제목 스타일  */
#titleName {
    text-align: center;
    color: black;
    height: 10vh;
    padding-top: 2vh;
    font-size: 2em;
}

/* 제목 "크루리스트, 맴버리스트" 스타일  */
#crewListTitle,
#crewMemberListTitle {
    width: 90%;
    margin: 0 auto;
    padding-top: 2vh;
    font-size: 1.5em;
}

#memberListButton {
    padding: 0px;
    border: 0px;
}
</style>

<div class="main-container">
    <div>
        <div id="titleName">크루관리</div>

        <div class="container mt-3">
            <h2 id="crewListTitle"> <%= userNickName2 %> 님의 크루 리스트</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>크루명</th>
                        <th>시</th>
                        <th>시/군/구</th>
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

	<div class="modal fade" id="crewModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
			</div>
		</div>
	</div>
</div>

<script>

    //크루리스트 기능
    function loadCrewNameList() {
         const userNo = <%= userNo %>;
         const params = {
                userNo : userNo
            //userNo: 1
            //페이지에 로그인정보에서 pk인 no = userNo
            //로그인 service개발완료 후 삭제 및 수정필요
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
                if (!response.ok) {
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
                        const crewNo = vo.crewNo;
                        const userNO = vo.userNo;
                        crewListTag += "<tr>";
                        if(vo.userNo === null){
                            crewListTag += "<td colspan='7'>로그인이 필요한 서비스입니다.</td><tr>";
                        }else if(vo.name === ""){
                            crewListTag += "<td>가입한 크루가 없습니다.</td><tr>";
                        }else if(vo.name !== null){
                            crewListTag += "<td><button class='crewNameButton' data-crew-no='" + vo.crewNo + "'>" + vo.name + "</button></td>";
                            crewListTag += "<td>" + vo.city + "</td>";
                            crewListTag += "<td>" + vo.district + "</td>";
                            crewListTag += "<td>" + vo.runningDay + "</td>";
                            crewListTag += "<td>" + vo.createdAt + "</td>";
                     
                         if (vo.role ==='member'){
                               if (vo.status === 'withdrawal') {
                                  crewListTag += "<td>" + vo.updatedAt + "</td>";
                               } else {
                                 crewListTag += "<td>-</td>";
                               }
   
                               if (vo.status === 'apply') {
                                 crewListTag += "<td>신청대기중</td>";
                               } else if (vo.status === 'approval') {
                                   crewListTag += "<td><button type='button' class='btn btn-outline-danger btn-sm withdrawButton' data-user-no='" + vo.userNo + "' data-crew-no='" + vo.crewNo + "'>탈퇴하기</button></td>";
                               } else if (vo.status === 'withdrawal') {
                               crewListTag += "<td>탈퇴한크루</td>";
                               }
                            crewListTag += "</tr>";
                        }else if(vo.role === 'leader'){
                           //삭제button id = crewDelButton, 수정 : crewEditButton
                           crewListTag += "<td>-</td>";
                           crewListTag += `<td><button type='button' class='btn btn-success btn-sm' id='crewEditButton' data-crew-no=` + vo.crewNo + `>수정</button><span> </span>
                           					<button type='button' class='btn btn-outline-danger btn-sm' id='crewDelButton' data-crew-no=` + vo.crewNo + `>삭제</button></td>`;
                           }
                        }
                    });
                } else {
                    console.error("응답 데이터가 배열이 아닙니다:", data);
                    crewListTag = "<tr><td>데이터를 불러올 수 없습니다.</td></tr>";
                }
                $("#crewNameList").html(crewListTag);
            })
            .catch(error => {
                console.error('Error:', error);
                $("#crewNameList").html("<tr><td>데이터를 불러오는 데 실패했습니다.</td></tr>");
            });
    }
      $(document).on('click', '.crewNameButton', function() {
            const crewNo = $(this).data('crew-no');

            console.log("crewNo 설정:", crewNo);
            // 필요한 경우 추가적인 동작 수행 (예: 멤버 목록 로드)
            loadCrewMemberList(crewNo);
        });
      
		// 크루 수정
		$(document).on('click', '#crewEditButton', function() {
			const crewNo = $(this).data('crew-no');
			$.ajax({
			    url: '/rs/crew/crewUpdate',
			    type: 'GET',
			    data: {
			        crew_no: crewNo
			    },
			    success: function(response) {
			        console.log(response);
			        const crewData = {
		        		name: response.name,
		                city: response.city,
		                district: response.district,
		                runningDay: response.runningDay,
		                description: response.description,
		                no: response.no,
		                status: response.status
		        	};
			        openCrewUpdateModal(crewData);
			    },
			    error: function(error) {
			        console.error("Error: " + error);
			    }
			});
		});
      
		
		// 크루 삭제
		$(document).on('click', '#crewDelButton', function() {
		    const crewNo = $(this).data('crew-no');
		
		    // 삭제 확인
		    if (confirm("크루를 삭제하시겠습니까?")) {
		        $.ajax({
		            url: `${pageContext.request.contextPath}/crew/crewDelete`,
		            type: 'GET',
		            data: { crew_no: crewNo },
		            success: function(result) {
		                if (result > 0) {
		                    alert("크루 삭제 성공");
		                    location.reload();
		                } else {
		                    alert("크루 삭제 실패");
		                }
		            },
		            error: function(error) {
		                console.error("Error: " + error);
		            }
		        });
	    	}
		});
   
    //맴버리스트 기능
    function loadCrewMemberList(crewNo) {
        const userNo = <%= userNo %>;
        const params = {
            userNo : userNo
            //userNo: 1
           //페이지에 로그인정보에서 pk인 no = userNo
           //로그인 service개발완료 후 삭제 및 수정필요
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
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // 성공적으로 데이터를 받아온 경우
                console.log(data);
                let memberListTag = "";
                if (Array.isArray(data) && data.length>0) {
                    data.forEach(mvo => {
                        //const crewNo = mvo.crewNo; // mvo 객체에서 crewNo 가져오기
                        console.log("mvo.userNo:", mvo.userNo, "crewNo:", crewNo);
                     
                            memberListTag += "<tr>"; // 행 시작
                            memberListTag += "<td>" + mvo.name + "</td>"; // 크루 이름
                            memberListTag += "<td>" + mvo.nickName + "</td>"; // 닉네임
                            memberListTag += "<td>" + mvo.createdAt + "</td>"; // 가입일
                     
                            if(mvo.role === 'member'){
                               memberListTag += "<td>-</td>";
                            }
                          else if (mvo.status === 'approval') {
                                memberListTag += "<td><button type='button' class='btn btn-outline-danger btn-sm kickButton' data-nick-name='" + mvo.nickName + "' data-user-no='" + mvo.userNo + "' data-crew-no='" +  mvo.crewNo + "'>강퇴하기</button></td>";
                            } else if (mvo.status === 'apply') {
                                memberListTag += "<td><button type='button' class='btn btn-success btn-sm acceptButton' data-nick-name='" + mvo.nickName + "' data-user-no='" + mvo.userNo + "' data-crew-no='" + mvo.crewNo + "'>✓</button><span> </span><button type='button' class='btn btn-danger btn-sm refuseButton 'data-nick-name='" + mvo.nickName + "' data-user-no='" + mvo.userNo + "' data-crew-no='" + crewNo + "'>×</button></td>";
                            } else if (mvo.status === 'withdrawal') {
                                memberListTag += "<td>탈퇴한크루</td>";
                            }
                            memberListTag += "</tr>"; // 행 끝
                    });
                } else {
                    memberListTag = "<tr><td colspan ='4'>크루원이 없습니다.</td></tr>";
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

    //크루리스트 탈퇴버튼
    $(document).on('click', '.withdrawButton', function(event) {
        event.preventDefault();
        alert("탈퇴하시겠습니까?");
    });

    $(document).on('click', '.withdrawButton', function(event) {
        event.preventDefault();
        const userNo = $(this).data('user-no');
        const crewNo = $(this).data('crew-no');
        const nickName = $(this).data('nick-name');
        console.log("Kick userNo:", userNo, "crewNo:", crewNo, "nickName:", nickName + " withdrawbutton내의 데이터");
        if (confirm("정말로 탈퇴하시겠습니까?")) {
            updateCrewStatus(userNo, crewNo, 'withdrawal');
        }
    });

    //맴버리스트 강퇴버튼
    $(document).on('click', '.kickButton', function(event) {
        event.preventDefault();
        const userNo = $(this).data('user-no');
        const crewNo = $(this).data('crew-no');
        const nickName = $(this).data('nick-name');
        console.log("Kick userNo:", userNo, "crewNo:", crewNo, "nickName:", nickName + " kickbutton내의 데이터");
        if (confirm("'" + nickName + "'님을 강퇴하시겠습니까?")) {
            updateCrewStatus(userNo, crewNo, 'withdrawal');
        }
    });

    //맴버리스트 승인버튼
    $(document).on('click', '.acceptButton', function(event) {
        event.preventDefault();
        alert("가입을 승인합니다");
    });

    $(document).on('click', '.acceptButton', function(event) {
        event.preventDefault();
        const userNo = $(this).data('user-no');
        const crewNo = $(this).data('crew-no');
        const nickName = $(this).data('nick-name');
        console.log("accept userNo:", userNo, "crewNo:", crewNo, "nickName:", nickName + " kickbutton내의 데이터");
        if (confirm("'" + nickName + "'님의 가입을 승인합니다.")) {
            updateCrewStatus(userNo, crewNo, 'approval');
        }
    });

    //맴버리스트 거부버튼
    $(document).on('click', '.refuseButton', function(event) {
        event.preventDefault();
        const userNo = $(this).data('user-no');
        const crewNo = $(this).data('crew-no');
        const nickName = $(this).data('nick-name');
        console.log("Refuse userNo:", userNo, "crewNo:", crewNo, "nickName:", nickName + " refusebutton내의 데이터");
        if (confirm("'" + nickName + "'님의 가입을 거부합니다.")) {
            updateCrewStatus(userNo, crewNo, 'withdrawal');
        }
    });

    // 맴버 status 업데이트 function
    function updateCrewStatus(userNo, crewNo, status) {
        const params = {
            userNo: userNo,
            crewNo: crewNo,
            status: status
        };

        $.ajax({
            url: '/rs/crew/crewManage/updateMemberStatus',
            data: params,
            type: 'POST',
            success: function(response) {
                if (response === "success") {
                    console.log('Status updated successfully');
                    loadCrewNameList();
                    loadCrewMemberList();
                } else {
                    console.error('Error: update failed');
                }
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });
    }

    window.onload = function() {
        loadCrewNameList();
        //loadCrewMemberList();
    };
</script>