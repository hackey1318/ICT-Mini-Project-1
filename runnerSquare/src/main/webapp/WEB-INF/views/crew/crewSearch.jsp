<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js_css/citySelect.js"></script>

<style>
	h1 {
		text-align: center;
		font-weight: bold;
		margin: 20px auto;
	}
	.body {
		color: #222;
		width: 80%;
		margin: 0 auto;
		padding-top: 180px;
		overflow: auto;
	}
	#search-form {
		width: 80%;
		height: 60px;
		position: fixed;
		margin: 10px auto;
		display: grid;
		grid-template-columns: 1.2fr 1fr 2fr 0.5fr;
		/*transition: all 0.1s;*/
		background-color: #fff;
	}
	#search-form>select, #search-form>input {
		margin: 10px;
		padding: 5px;
		height: 40px;
		border: 1px solid #ddd;
		border-radius: 10px;
	}
	input[type=submit] {
		background-color: #FFED8A;
	}
	#crews, .crewList {
		display: grid;
		grid-template-columns: 1fr 1fr;
		margin: 5px;
		padding: 5px;
		list-style-type: none;
	}
	@media(min-width:1000px) {
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
	#crews {
		margin-top: 95px;
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

<script>
	var lastY = 0;
	window.addEventListener('scroll', ()=>{
		let offset = 0.6;
		let curY = window.scrollY;
		let diff = curY-lastY;
		// console.log(curY);
		if(curY < 110) {
			document.getElementById("search-form").style.transform='translateY(-'+curY+'px)';
		}
		else {
			// document.getElementById("search-form").style.transform='translateY(-'+curY+'px)';
		}
		lastY = curY;
	});

</script>

<div class="body">
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
	
	<ul id="crews">
	<c:forEach var="vo" items="${crewList}">
		<li class="crewList">
			<div class="imgBox"><img class="crewImg" src="${pageContext.request.contextPath}/img/running.jpg"/></div>
			<div>
				<div>${vo.name}</div>
				<div>${vo.description}</div>
			</div>
		</li>
	</c:forEach>
	</ul>	
	
	<!-- paging -->
	<ul class="pagination justify-content-center">		
		<!-- 이전 페이지 -->
	    <c:if test="${pvo.nowPage == 1}">
	    	<li class="page-item"><a class="page-link" href="#">◀</a></li>
	    </c:if>
	    <c:if test="${pvo.nowPage > 1}">
	    	<li class="page-item">
		    	<a class="page-link" href="${pageContext.request.contextPath}/crew/crewSearch?nowPage=${pvo.nowPage - 1}&city=${city}&distric=${district}&crewName=${crewName}">◀</a>
	    	</li>
	    </c:if>
	    
	    <!-- 페이지 번호 -->
	    <c:forEach var="p" begin="${pvo.startPageNum }" end="${pvo.startPageNum + pvo.onePageCount - 1 }">
	    	<c:if test="${p <= pvo.totalPage}">
		    	<c:if test="${p == pvo.nowPage}">
		    		<li class="page-item active">
		    	</c:if>
		    	<c:if test="${p != pvo.nowPage}">
		    		<li class="page-item">
		    	</c:if>
		    	<a class="page-link" href="${pageContext.request.contextPath}/crew/crewSearch?nowPage=${p}&city=${city}&distric=${district}&crewName=${crewName}">${p}</a></li>
	    	</c:if>
	    </c:forEach>
	    
	    <!-- 다음 페이지 -->
	    <c:if test="${pvo.nowPage == pvo.totalPage}">
	    	<li class="page-item"><a class="page-link" href="#">▶</a></li>
	    </c:if>
	    <c:if test="${pvo.nowPage < pvo.totalPage}">
	    	<li class="page-item">
		    	<a class="page-link" href="${pageContext.request.contextPath}/crew/crewSearch?nowPage=${pvo.nowPage + 1}&city=${city}&distric=${district}&crewName=${crewName}">▶</a>
	    	</li>
	    </c:if>
	</ul>
</div>