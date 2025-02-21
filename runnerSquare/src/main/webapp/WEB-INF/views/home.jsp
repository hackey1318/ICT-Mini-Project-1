<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js_css/crewDetail.js"></script>
<link href="${pageContext.request.contextPath}/js_css/crewDetail.css" rel="stylesheet" type="text/css"/>

<style>
	#banner {
		width: 100%;
		padding-top: 180px;
	}
	#container {
		text-align: center;
	}
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
		width: 140px;
		height: 60px;
		background-color: #C5FFCA;
		text-align:center;
	}
	@media(max-width:800px) {
		#crewAll {
			font-size: 0.8em;
			width:100px;
			height: 40px;
		}
	}
</style>

<img id="banner" src="img/running.jpg"/>
<div id="container">
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
	                <button>크루가입</button>
	                <button>게스트런 신청</button>
	            </div>
	        </div>
	    </div>
	</div>
	<button id="crewAll" onclick="location.href='${pageContext.request.contextPath}/crew/crewSearch'">크루 전체보기</button>
</div>

<script>
	/*
	document.addEventListener("DOMContentLoaded", function() {
		const test = document.getElementById("test");
		test.innerHTML = "";

		fetch('/rs')
			.then(res => res.json())
			.then(data => {
				data.forEach((info) => {
					test.innerHTML += info;
				});
			})
			.catch(e => {
				console.error("crew info error", e);
			});
	});
	*/
</script>