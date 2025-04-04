<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewJoin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewDetail.js"></script>
<link href="${pageContext.request.contextPath}/resources/crewDetail.css" rel="stylesheet" type="text/css"/>

<% String contextPath = request.getContextPath(); %>
<link rel="stylesheet" href="<%= contextPath %>/resources/banner.css">
<script defer src="<%= contextPath %>/resources/banner.js"></script>
<script defer src="<%= contextPath %>/resources/home.js"></script>
<style>
	.crewInfoBox {
	    display: flex;
	    align-items: center;
	    justify-content: flex-start;
	    width: 80%;
	    max-width: 1500px;
	    border: 1px solid #ddd;
	    padding: 10px;
	    margin: 20px auto;
	}
	.crewInfo>h2 {
		font-weight: bold;
	}
	.crewImg {
	    width: 150px;
	    height: 150px;
	    object-fit: cover; /* 이미지를 비율에 맞게 자르기 */
	    margin-right: 20px;
	}
	.crewInfo {
	    display: flex;
	    flex-direction: column;
	    justify-content: space-between; /* 세로로 공간을 분배 */
	    height: 150px;
	    flex-grow: 1; /* crewInfo가 나머지 공간을 차지하도록 설정 */
	}
	#openCrewDetailBtn {
	    align-self: flex-end; /* 버튼을 crewInfo의 하단 오른쪽에 배치 */
	    margin-top: auto; /* 버튼을 crewInfo의 하단에 배치 */
	    background-color: #ffb;
	    border: 1px solid #ddd;
	    border-radius: 10px;
	}
	#crewAll {
		display: block;
		background-color: #C5FFCA;
		text-align:center;
		margin: 20px auto 40px;
		border: 1px solid #ccc;
		border-radius: 10px;
	}
	@media(min-width: 992px) {
		.crewImg, .crewInfo {
		    width: 200px;
		    height: 200px;
		}
		#openCrewDetailBtn, #crewAll {
			font-size: 1.2em;
			padding: 5px 10px;
		}
	}
</style>
<div class='main-container'>
	<div class="bannerContainer">
	    <button class="bannerButton prevButton">◀</button>
	    <div class="bannerWrapper"></div>
	    <button class="bannerButton nextButton">▶</button>
	</div>
	<div id="crewListContainer"></div>
	<c:forEach var="vo" items="${crewList}" begin="0" end="2">
		<div class="crewInfoBox">
	        <c:set var="firstImage" value="${not empty vo.imageIdList ? vo.imageIdList[0] : 'img/logo.png'}" />
            <img class="crewImg" src="${empty firstImage ? 'img/logo.png' : '/file-system/download/' + firstImage}" />
			<div class="crewInfo">
				<h2>${vo.name}</h2>
				<div>${vo.description}</div>
				<button type="button" id="openCrewDetailBtn" data-bs-toggle="modal"
					data-bs-target="#crewDetailModal" data-id="${vo.no}">상세보기</button>
			</div>
		</div>
	</c:forEach>
	<div class="modal fade" id="crewDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
	                <h4 class="modal-title" id="modalTitle">크루 이름</h4>
	                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	            </div>

	            <div class="modal-body">
	            	<div class="crew-content">
		                <div id="modalImageContainer" class="image-container"></div>
		                <div class="crewDetail">
		                    <div id="modalDescription"></div>
		                    <div>주요활동지역</div><div id="modalLocation"></div>
		                    <div>주요러닝데이</div><div id="modalRunningDay"></div>
		                </div>
		            </div>
		            <div class="crew-buttons">
			            <button onclick="crewJoin('member', getCrewNo())">크루가입</button>
		                <button onclick="location.href='/rs/run/runSearch?crewno='+getCrewNo()">게스트런 신청</button> <!-- 러닝 검색으로 이동 -->
		            </div>
	            </div>
			</div>
		</div>
	</div>
	<button id="crewAll" onclick="location.href='${pageContext.request.contextPath}/crew/crewSearch'">크루 전체보기</button>

</div>