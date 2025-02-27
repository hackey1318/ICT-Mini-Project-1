<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewJoin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewDetail.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/citySelect.js"></script>
<link href="${pageContext.request.contextPath}/resources/crewDetail.css" rel="stylesheet" type="text/css"/>

<style>
	h1 {
		text-align: center;
		font-weight: bold;
		margin: 20px auto;
	}
	.main-container {
		width: 80%;
		margin: 0 auto;
		margin-top: 222px; /* header 높이만큼 여백 */
		margin-bottom: 34px; /* footer 높이만큼 여백 */
		height: calc(100vh - 256px); /* 화면 높이에서 header와 footer 높이를 뺀 값 */
		overflow-y: auto; /* 세로 스크롤 활성화 */
	}
	#search-form {
		height: 60px;
		margin: 10px auto;
		display: grid;
		grid-template-columns: 1.2fr 1fr 2fr 0.5fr;
		background-color: #fff;
	}
	#search-form>select, #search-form>input {
		margin: 10px;
		padding: 5px;
		height: 40px;
		border: 1px solid #ddd;
		border-radius: 10px;
	}
	#search-form>input[type=submit] {
		background-color: #FFED8A;
	}
	#crews, .crewList {
		display: grid;
		grid-template-columns: 1fr 1fr;
		margin: 5px;
		padding: 5px;
		list-style-type: none;
	}
	@media(min-width:992px) {
		#crews {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr;
		}
	}
	@media(min-width:1500px) {
		#crews {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr 1fr;
		}
	}
	.crewList {
		border: 1px solid #ddd;
	}
	.imgBox {
		position: relative;
		width: 100%;
	}
	.imgBox::after {
		display: block;
		content: "";
		padding-bottom: 100%;
	}
	.crewImg {
		position: absolute;
		top: 0;
		left: 0;
		z-index: -1;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	.crewList div {
		overflow: hidden;
		text-overflow: ellipsis;
		text-align: center;
		padding: 0 5px;
		z-index: -2;
	}
	.crewList div:first-child {
		font-size: 1.3em;
		white-space: nowrap;
	}
	.crewList div:last-child {
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
	}
	.page-link  {
		color: #000;
	}
	.pagination {
		--bs-pagination-hover-color: #000;
		--bs-pagination-focus-color: #000;
		--bs-pagination-focus-box-shadow: none;
	}
	.active>.page-link, .page-link.active {
		color: #FFED8A;
		background-color: #222;
		border-color: #eee;
	}
</style>

<div class="main-container">
	<div id="search-bar">
		<h1>크루 검색</h1>
		<form id="search-form" action="${pageContext.request.contextPath}/crew/crewSearch">
			<select name="city" id="citySelect" onchange="changeState()">
			    <option value="">시/도</option>
			</select>
			<select name="district" id="districtSelect">
			    <option value="">시/군/구</option>
			</select>
			<input type="text" name="crewName" id="crewName" placeholder="크루명"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	<ul id="crews">
	<c:forEach var="vo" items="${crewList}">
		<li class="crewList" id="openCrewDetailBtn" data-bs-toggle="modal"
					data-bs-target="#crewDetailModal" data-id="${vo.no}">
			<div class="imgBox">
		        <c:set var="firstImage" value="${not empty vo.imageIdList ? vo.imageIdList[0] : 'img/logo.png'}" />
                <img class="crewImg" src="${pageContext.request.contextPath}/file-system/download/${firstImage}" />
			</div>
			<div>
				<div>${vo.name}</div>
				<div>${vo.description}</div>
			</div>
		</li>
	</c:forEach>
	</ul>
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
	
	<!-- paging -->
	<ul class="pagination justify-content-center">		
		<!-- 이전 페이지 -->
	    <c:if test="${pvo.nowPage == 1}">
	    	<li class="page-item"><a class="page-link" href="#">◀</a></li>
	    </c:if>
	    <c:if test="${pvo.nowPage > 1}">
	    	<li class="page-item">
		    	<a class="page-link" href="${pageContext.request.contextPath}/crew/crewSearch?nowPage=${pvo.nowPage - 1}&city=${pvo.city}&district=${pvo.district}&crewName=${pvo.crewName}">◀</a>
	    	</li>
	    </c:if>
	    
	    <!-- 페이지 번호 -->
	    <c:forEach var="p" begin="${pvo.startPageNum }" end="${pvo.totalPage}">
	    	<c:if test="${p <= pvo.totalPage}">
		    	<c:if test="${p == pvo.nowPage}">
		    		<li class="page-item active">
		    	</c:if>
		    	<c:if test="${p != pvo.nowPage}">
		    		<li class="page-item">
		    	</c:if>
		    	<a class="page-link" href="${pageContext.request.contextPath}/crew/crewSearch?nowPage=${p}&city=${pvo.city}&district=${pvo.district}&crewName=${pvo.crewName}">${p}</a></li>
	    	</c:if>
	    </c:forEach>
	    
	    <!-- 다음 페이지 -->
	    <c:if test="${pvo.nowPage == pvo.totalPage}">
	    	<li class="page-item"><a class="page-link" href="#">▶</a></li>
	    </c:if>
	    <c:if test="${pvo.nowPage < pvo.totalPage}">
	    	<li class="page-item">
		    	<a class="page-link" href="${pageContext.request.contextPath}/crew/crewSearch?nowPage=${pvo.nowPage + 1}&city=${pvo.city}&district=${pvo.district}&crewName=${pvo.crewName}">▶</a>
	    	</li>
	    </c:if>
	</ul>
</div>