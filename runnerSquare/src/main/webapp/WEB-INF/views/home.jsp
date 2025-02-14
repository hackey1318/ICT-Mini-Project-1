<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	#banner {
		width: 100%;
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
</style>

<img id="banner" src="img/running.jpg"/>
<div class="container">
	<!-- 추후 forEach 문으로 변경 -->
	<div class="crewInfoBox">
		<img class="crewImg" src="img/logo.png"/>
		<div class="crewInfo">
			<h2>크루명1</h2>
			<div>간략한 크루소개</div>
			<button>상세보기</button>
		</div>
	</div>
	<div class="crewInfoBox">
		<img class="crewImg" src="img/logo.png"/>
		<div class="crewInfo">
			<h2>크루명2</h2>
			<div>간략한 크루소개</div>
			<button>상세보기</button>
		</div>
	</div>
	<div class="crewInfoBox">
		<img class="crewImg" src="img/logo.png"/>
		<div class="crewInfo">
			<h2>크루명3</h2>
			<div>간략한 크루소개</div>
			<button>상세보기</button>
		</div>
	</div>
	<button id="crewAll">크루 전체보기</button>
</div>