<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		
		/*font-size:1vw;
		margin: 20px;
		margin-left:calc(50% - 5vw);*/
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
				<h2>크루명 ${vo.name}</h2>
				<div>간략한 크루소개 ${vo.description}</div>
				<button>상세보기</button>
			</div>
		</div>
	</c:forEach>
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