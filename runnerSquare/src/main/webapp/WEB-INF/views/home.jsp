<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewDetail.js"></script>
<link href="${pageContext.request.contextPath}/resources/crewDetail.css" rel="stylesheet" type="text/css"/>

<% String contextPath = request.getContextPath(); %>
<link rel="stylesheet" href="<%= contextPath %>/resources/banner.css">
<script defer src="<%= contextPath %>/resources/banner.js"></script>
<style>
	.crewInfoBox {
		width: 80%;
		display : flex;
		border: 1px solid #ddd;
		padding: 10px;
		margin: 20px auto;
	}
	.crewImg, .crewInfo {
		float: left;
		width: 30%;
	}
	.crewInfo {
		background-color: #eee;
		width: 70%;
		height: 200px;
		padding: 10px;
	}
	.crewInfo>div {
		height: 100px;
	}
	.crewInfo>button {
		float: right;
		background-color: #FFED8A;
		width: 20%;
	}

	#crewAll {
		display:inline;
		width: 10vw;
		height:0;
		padding-bottom:5%;
		background-color: #C5FFCA;
		text-align:center;
		font-size:1vw;
		margin: 20px;
		margin-left:calc(50% - 5vw);
	}
	@media(max-width:800px) {
		#crewAll {
			font-size:15px;
			width:100px;
		}
	}
	.main-container {
		margin-top: 222px; /* header 높이만큼 여백 */
		margin-bottom: 34px; /* footer 높이만큼 여백 */
		height: calc(100vh - 256px); /* 화면 높이에서 header와 footer 높이를 뺀 값 */
		overflow-y: auto; /* 세로 스크롤 활성화 */
	}
</style>
<div class='main-container'>
	<div class="bannerContainer">
	    <button class="bannerButton prevButton">◀</button>
	    <div class="bannerWrapper"></div>
	    <button class="bannerButton nextButton">▶</button>
	</div>
	<c:forEach var="vo" items="${crewList}" begin="0" end="2">
		<div class="crewInfoBox">
			<img class="crewImg" src="img/logo.png"/>
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
	                <div>
	                    <img id="modalImage" src="/rs/img/running.jpg" />
	                </div>
	                <div class="crewDetail">
	                    <div id="modalName">크루 이름</div>
	                    <div id="modalDescription">설명</div>
	                    <div id="modalLocation">도시, 구</div>
	                    <div id="modalRunningDay">러닝데이</div>
	                </div>
	                <button onclick="crewJoin(crewNo)">크루가입</button> <!-- crewNo 구해야 함 -->
	                <button onclick="location.href='/rs/'">게스트런 신청</button> <!-- 러닝 검색으로 이동 -->
	            </div>
	        </div>
	    </div>
	</div>
	<button id="crewAll" onclick="location.href='${pageContext.request.contextPath}/crew/crewSearch'">크루 전체보기</button>

</div>