<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	h1 {
		text-align:center;
	}
	button {
		padding: 10px;
  	   	background-color:white;
    	border: 2px solid #ddd;
    	border-radius: 10px;
    	font-size: 16px;
    	width: 20%;
    	box-sizing: border-box;
    	transition: border-color 0.3s ease;
    	height: 46px; 
	}
	button:focus {
    	border-color: #007BFF;
    	outline: none;
	}
	.container{
	 	background-color: beige;
		width: 100%;
		height: 900px;
		padding-top: 180px;
	}
	.button-top{
		display: flex;
  		justify-content: center;
  		align-items: center; 
		margin:0 200px;
		gap:50px;
	}
	.input-group {
		display: flex;
		justify-content:center;
		align-items:center;
		padding-top:50px; 
  		gap: 0; 
  	}
  	.dropdown>input{
  	   	padding: 10px;
  	   	background-color:white;
    	border: 2px solid #ddd;
    	border-radius: 10px;
    	font-size: 16px;
    	width: 100%;
    	box-sizing: border-box;
    	transition: border-color 0.3s ease;
    	height: 46px; /* 높이를 통일하여 일관된 모양 유지 */
	}
	.dropdown>input:focus {
    	border-color: #007BFF;
    	outline: none;
	}
	.dropdown {
  		position: relative; 
  		display: inline-block; 
	}
	.droplist {
		width:100%;
  		background-color: #ddd; 
  		color: black; 
  		padding: 10px 15px; 
  		border: black 1px solid; 
  		cursor: pointer;
	}
	.dropdown-content {
  		display: none; 
  		position: absolute; 
  		background-color: #f9f9f9; 
  		min-width: 160px; 
  		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); 
  		z-index: 1; 
  		top:100%;
  	}
	.dropdown-content a, .dropdown-content select {
  		color: black; 
  		padding: 12px 16px; 
  		text-decoration: none; 
  		display: block; 
	}
	.dropdown-content a:hover {
  		background-color: #f1f1f1; 
	}
	.dropdown:hover .dropdown-content {
  		display: block; 
	}
	#calendar {
		position: absolute; 
		display:inline-block;
		top:100%;
	}
	.list{
		list-style-type: none;
		overflow:auto;
		padding-top:50px;
		padding-left:300px;
		padding-right:20px;
	}
	.list>li{
		float:left;
		display:flex;
		justify-content:center;
		line-height:50px;
		border-bottom:1px solid gray;
		width:12%;
		text-align:center; 
	}
  	.fixed-button {
    	position: fixed; 
    	bottom: 100px; 
    	right: 100px; 
    	background-color: #C5FFCA; 
    	color: white; 
    	border: none; 
    	border-radius: 50%; 
    	width: 65px; 
    	height: 65px; 
    	font-size: 15px; 
    	text-align: center; 
    	line-height: 60px; 
    	cursor: pointer; 
    	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); 
    	z-index: 1000; 
  	}
  	.fixed-button a {
    	color: white; 
    	text-decoration: none; 
    	display: block; 
  	}
	
  	@media (max-width: 768px) {
    	.fixed-button {
      	width: 50px; 
      	height: 50px; 
      	font-size: 20px; 
      	line-height: 50px; 
      	bottom: 15px; 
      	right: 15px; 
    	}
  	}

	section {
    	display: grid;
    	grid-template-columns: auto auto;
    	gap: 10px;
    	padding-left: 10px;
    	align-items: center;
	}
	section .left ul, section .right ul {
    	list-style-type: none;
    	padding: 0;
    	margin: 0;
	}
	section .left ul li, section .right ul li {
    	display: flex;
    	align-items: center;
    	height: 50px; 
    	font-size:25px;
	}
	section .right ul li input {
    	width: 100%;
    	padding: 10px;
    	border: 2px solid #ddd;
    	border-radius: 10px;
    	font-size: 16px;
    	box-sizing: border-box;
    	transition: border-color 0.3s ease;
	}
	section .right ul li input:focus {
    	border-color: #007BFF;
    	outline: none;
	}
    .button-container {
    	display: flex;
    	justify-content:flex-end;
    	margin-top:20px;
    	gap: 10px;
	}
</style>

<div class="container">
	<h1>러닝 검색</h1>
	<div class="button-top">
		<button class="btn btn-primary" id="dateBtn">날짜</button>
		<button class="btn btn-warning" id="dayBtn">요일</button>
	</div>	
	<form method="get" id="runList" action="${pageContext.request.contextPath}/run/runList">
		<div class="input-group">
  			<div class="dropdown" id="dateorday">
  				<input class="droplist" id="dateordayInput" name="searchDate" value="날짜/요일"/>
  				<select class="dropdown-content" id="daySelect" name="searchDay" style="display:none">
    				<option value="월요일">월요일</option>
        			<option value="화요일">화요일</option>
        			<option value="수요일">수요일</option>
        			<option value="목요일">목요일</option>
        			<option value="금요일">금요일</option>
        			<option value="토요일">토요일</option>
        			<option value="일요일">일요일</option>
    			</select>
    		</div>
  	  		<div class="dropdown">
    			<input type="text" class="droplist" id="sidoInput" name="searchSido" value="시/도"/>
    			<select class="dropdown-content" id="sidoSelect">
      				<option value="서울시">서울시</option>
      				<option value="경기도">경기도</option>
      				<!-- <option value="제주시">제주시</option> -->
    			</select>
  			</div>
  			<div class="dropdown">
    			<input type="text" class="droplist" id="guInput" name="searchGu" value="구"/>
    			<select class="dropdown-content" id="guSelect">
      				<option value="강남구">강남구</option>
    				<option value="강동구">강동구</option>
    				<option value="강북구">강북구</option>
    				<option value="강서구">강서구</option>
    				<option value="관악구">관악구</option>
    				<option value="광진구">광진구</option>
    				<option value="구로구">구로구</option>
    				<option value="금천구">금천구</option>
    				<option value="노원구">노원구</option>
    				<option value="도봉구">도봉구</option>
    				<option value="동대문구">동대문구</option>
    				<option value="동작구">동작구</option>
    				<option value="마포구">마포구</option>
    				<option value="서대문구">서대문구</option>
    				<option value="서초구">서초구</option>
    				<option value="성동구">성동구</option>
    				<option value="성북구">성북구</option>
    				<option value="송파구">송파구</option>
    				<option value="양천구">양천구</option>
    				<option value="영등포구">영등포구</option>
    				<option value="용산구">용산구</option>
    				<option value="은평구">은평구</option>
    				<option value="종로구">종로구</option>
    				<option value="중구">중구</option>
    				<option value="중랑구">중랑구</option>
   				</select>
  			</div>
  			<div class="dropdown">
    			<input type="time" id="timeInput"/ name="searchTime">
  			</div>
  			<div class="dropdown">
    			<input type="text" class="droplist" id="crewNameInput" name="searchCrewName" placeholder="크루명"/> 
  			</div>
	  		<div class="dropdown">
    			<button class="droplist" type="submit" id="searchButton" style="background-color:white;
    				border: 2px solid #ddd;">검색</button>
  			</div>
  		</div>
  	</form>
  
   	<ul class="list">
		<li>번호</li>
		<li>이름</li>
		<li>시/도</li>
		<li>지역</li>
		<li>출발 시간</li>
		<li>집결지</li>
		<li>크루명</li>
		<li>번개/정기</li>
		
		<c:forEach var="vo" items="${list }">
			<li>${vo.run_no}</li>
			<li>${vo.runname}</li>
			<li>${vo.runsido}</li>
			<li>${vo.rungu}</li>
			<li>${vo.runtime}</li>
			<li>${vo.runspot}</li>
			<li>${vo.crewname}</li>
			<li>${vo.runType}</li>
		</c:forEach>
	</ul>
	
	 <a href="${pageContext.request.contextPath}/run/runMake" class="fixed-button" id="openDialogBtn"  data-bs-toggle="modal" data-bs-target="#myModal">
        <img src="../img/plus_button.png" style="width:64px; height:64px;">
    </a>
    
    <!-- The Modal -->
	<!-- <div class="modal fade" id="myModal"> -->
	<div class="modal fade" id="myModal" aria-hidden="true" style="display:none;">
  		<div class="modal-dialog modal-dialog-centered">
    		<div class="modal-content">
      			<!-- Modal Header -->
      			<div class="modal-header">
        			<h4 class="modal-title">번개런 등록</h4>
        			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      			</div>
			    <!-- Modal body -->
    	  		<div class="modal-body">
        			<p>러닝을 등록하시겠습니까?</p>
        			<%-- <form id="runWriteForm" method ="post" action="<%=request.getContextPath()%>/run/runFormOk"> --%>
        			<form method ="post" id="runWriteForm">
        				<section>
        					<div class="left">
        						<ul>
        							<li>번개런이름</li>
          							<li>날짜</li>
           							<li>지역(시/도)</li>
           							<li>지역(구/군)</li>
           							<li>집결지</li>
           							<li>집결시간</li>
           							<li>최대인원</li>
        						</ul>
        					</div>
        					<div class="right">
        						<input type="hidden" name="userid" id="userid" value="kjune2138"/>
        						<input type="hidden" name="runtype" id="runtype" value="번개런"/>
        						<ul>
        							<li><input type="text" name="runname" id="runname" placeholder="최대 20자만 허용됩니다."/></li>
        							<li><input type="date" name="rundate" id="rundate" placeholder="2025-02-19"/></li>
        							<li><input type="text" name="runsido" id="runsido" value="서울시"/></li>
        							<li><input type="text" name="rungu" id="rungu" placeholder="성동구"/></li>
        							<li><input type="text" name="runspot" id="runspot" placeholder="성수역2번출구"/></li>
        							<li><input type="time" name="runtime" id="runtime" placeholder="16:00"/></li>
        							<li><input type="number" name="runmaxnum" id="runmaxnum" min="1" max="30" placeholder="최대 인원 수 30명"/></li>
        						</ul>
        					</div>
        				</section>
        				<div class="button-container">
      						<input type="reset" class="btn btn-danger" value="다시쓰기"/>
        					<input type="submit" class="btn btn-warning" value="등록"/>
        				</div>
        			</form>
      			</div>
    		</div>
    	</div>
	</div>
	<div id="view" style="background-color:beige; padding:10px;"></div>
</div>

<script>
	const dateBtn = document.getElementById('dateBtn');
	const dayBtn = document.getElementById('dayBtn');
	const dateordayInput = document.getElementById('dateordayInput');
	const calendar = document.getElementById('calendar');
	const daySelect = document.getElementById('daySelect');
	const dateorday = document.getElementById('dateorday');
	const sidoInput = document.getElementById('sidoInput');
	const guInput = document.getElementById('guInput');
	const timeInput = document.getElementById('timeInput');
	const sidoSelect = document.getElementById('sidoSelect');
	const guSelect = document.getElementById('guSelect');
	const timeSelect = document.getElementById('timeSelect');
	const runForm = document.getElementById('runWriteForm');
		
	$(function(){
		//form의 데이터를 비동기식으로 서버로 보내 번개런 등록하기
		$("#runWriteForm").on('submit',function(){
			event.preventDefault();
			if(!runFormChk()){
				return;
			}
			var url="/rs/run/ajaxObject";
			//serialize():form의 데이터를 쿼리 데이터로 생성하는 함수
			var params=$("#runWriteForm").serialize();
			console.log(params);
			$.ajax({
				url:url,
				data:params,
				type:"POST",
				success:function(response){
					console.log(response);	
					if (response.status == "success" ) {
	                    alert("번개런이 정상 등록되었습니다.");
	                    window.location.href = "${pageContext.request.contextPath}/run/runSearch";
	                } else if (response.status == "error") {
	                    alert("번개런 등록 실패하였습니다.");
	                } else {
	                    alert("알 수 없는 오류가 발생했습니다.");
	                }
	                 
				},error:function(e){
					console.log(e.responseText);
					 alert("서버 오류가 발생했습니다.");
				}
			});
		});
		$("runList").on('submit',function(event){
			event.preventDefault();
			var params=$("#runList").serialize();
			console.log(params);
			$.ajax({
				url:$(this).attr('action'),
				data:params,
				type:"GET",
				dataType:"json",
				success:function(response){
					console.log(response);
					displayResults(response);
                }, error:function(e){
					console.log(e.responseText);
					 alert("서버 오류가 발생했습니다.");
				}
			});
		});
	});
	
	function displayResult(response){
		$(".list").empty();
	    $(".list").append("<li>번호</li><li>이름</li><li>시/도</li><li>지역</li><li>출발 시간</li><li>집결지</li><li>크루명</li><li>번개/정기</li>");

	    if (response && response.length > 0) {
	        $.each(response, function(index, vo) {
	            $(".list").append(
	                "<li>" + vo.run_no + "</li>" +
	                "<li>" + vo.runname + "</li>" +
	                "<li>" + vo.runsido + "</li>" +
	                "<li>" + vo.rungu + "</li>" +
	                "<li>" + vo.runtime + "</li>" +
	                "<li>" + vo.runspot + "</li>" +
	                "<li>" + vo.crewname + "</li>" +
	                "<li>" + vo.runType + "</li>"
	            );
	        });
	    } else {
	        $(".list").append("<li>검색 결과가 없습니다.</li>");
	    }	
	}
	
	function runFormChk(){
        if(document.getElementById("runname").value===""){
            alert("번개런 이름을 입력하세요")
            return false;
        }else if(document.getElementById("rundate").value===""){
            alert("날짜를 입력하세요")
            return false;
        }else if(document.getElementById("runsido").value===""){
            alert("지역(시/도)을 입력하세요")
            return false;
        }else if(document.getElementById("rungu").value===""){
            alert("지역(구/군)을 입력하세요")
            return false;
        }else if(document.getElementById("runspot").value===""){
            alert("집결지를 입력하세요")
            return false;
        }else if(document.getElementById("runtime").value===""){
            alert("집결시간을 입력하세요")
            return false;
        }else if(document.getElementById("runmaxnum").value===""){
            alert("최대인원을 입력하세요")
            return false;
        }
        return true;
    }
	
	dateBtn.addEventListener('click', function() {
		dateordayInput.type = "date"; 
	    daySelect.style.display = "none";
	});
	
	dayBtn.addEventListener('click', function() {
		dateordayInput.type = "text"; 
		dateordayInput.value = "요일";
		daySelect.style.display = "none";
	});
	
	daySelect.addEventListener('change', function(event) {
	    const day = event.target.value;
	    console.log("선택된 요일:", day);
	    dateordayInput.value = day;
	    // 선택된 요일 처리 로직 추가
	    daySelect.style.display = "none";
	});
	
	function updateInputText(input, select){
		input.value = select.value;
	}
	
	sidoSelect.addEventListener('change', function() {
	    updateInputText(sidoInput, sidoSelect);
	    console.log("선택된 시/도:", sidoSelect.value);
	});

	guSelect.addEventListener('change', function() {
	    updateInputText(guInput, guSelect);
	    console.log("선택된 구:", guSelect.value);
	});
	
	dateordayInput.addEventListener('mouseover', function() {
	    const state = dateordayInput.value;
	    if (state === "요일") {
	    	daySelect.style.display = "block";
	    }
	});

	dateorday.addEventListener('mouseleave', function() {
	    daySelect.style.display = "none";
	});
		
</script>
		
	
