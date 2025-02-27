<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
h1 {
	text-align: center;
}

button {
	padding: 10px;
	background-color: white;
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

.container {
	/* background-color: beige; */
	width: 100%;
	height: 900px;
	padding-top: 180px;
}

.button-top {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 200px;
	gap: 50px;
}

.input-group {
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 50px;
	gap: 0;
}

.dropdown>input {
	padding: 10px;
	background-color: white;
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
	width: 100%;
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
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	top: 100%;
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
	display: inline-block;
	top: 100%;
}

.list {
	list-style-type: none;
	overflow: auto;
	padding-top: 10px;
	padding-left: 50px;
	padding-right: 20px;
}

.list>li {
	float: left;
	display: flex;
	justify-content: center;
	line-height: 50px;
	border-bottom: 1px solid gray;
	width: 12%;
	text-align: center;
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

@media ( max-width : 768px) {
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
	font-size: 15px;
}

section .right ul li input {
	width: 100%;
	padding: 10px;
	border: 2px solid #ddd;
	border-radius: 10px;
	font-size: 13px;
	box-sizing: border-box;
	transition: border-color 0.3s ease;
}

section .right ul li input:focus {
	border-color: #007BFF;
	outline: none;
}

.button-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
	gap: 10px;
}

.main-container {
		margin-top: 222px; /* header 높이만큼 여백 */
		margin-bottom: 34px; /* footer 높이만큼 여백 */
		height: calc(100vh - 256px); /* 화면 높이에서 header와 footer 높이를 뺀 값 */
		overflow-y: auto; /* 세로 스크롤 활성화 */
	}
</style>
<% Integer userNo = (Integer) session.getAttribute("userNo"); %>
<div class='main-container'>
	<h1>러닝 검색</h1>
	<div class="button-top">
		<button class="btn btn-primary" id="dateBtn">날짜</button>
		<button class="btn btn-warning" id="dayBtn">요일</button>
	</div>
	<form method="get" id="runList" action="${pageContext.request.contextPath}/run/runSearch">
		<div class="input-group">
			<div class="dropdown" id="dateorday">
				<input class="droplist" id="dateordayInput" placeholder="날짜/요일" /> <select
					class="dropdown-content" id="daySelect" style="display: none">
					<option value=""></option>
					<option value="Monday">월요일</option>
					<option value="Tuesday">화요일</option>
					<option value="Wednesday">수요일</option>
					<option value="Thursday">목요일</option>
					<option value="Friday">금요일</option>
					<option value="Saturday">토요일</option>
					<option value="Sunday">일요일</option>
				</select>
			</div>
			<div class="dropdown">
				<input type="text" class="droplist" id="sidoInput" name="searchSido"
					placeholder="시/도" /> <select class="dropdown-content"
					id="sidoSelect">
					<option value=""></option>
					<option value="서울시">서울시</option>
					<option value="경기도">경기도</option>
					<option value="제주시">제주시</option>
				</select>
			</div>
			<div class="dropdown">
				<input type="text" class="droplist" id="guInput" name="searchGu"
					placeholder="구" /> <select class="dropdown-content" id="guSelect">
					<option value=""></option>
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
				<input type="time" id="timeInput" name="searchTime" />
			</div>
			<div class="dropdown">
				<input type="text" class="droplist" id="crewNameInput"
					name="searchCrewName" placeholder="크루명" />
			</div>
			<div class="dropdown">
				<button class="droplist" type="submit" id="searchButton"
					style="background-color: white; border: 2px solid #ddd;">검색</button>
			</div>
		</div>
	</form>

	<div class="list">
		<table class="table table-hover">
			<thead class="table-success">
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>시/도</th>
					<th>지역</th>
					<th>시간</th>
					<th>집결지</th>
					<th>타입</th>
					<th>잔여인원</th>
					<th>참여중</th>
					<th>정보</th>
				</tr>
			</thead>
			<tbody id="view">
			</tbody>
		</table>
	</div>

	<a href="#" class="fixed-button" id="makerunBtn" data-bs-toggle="modal"
		data-bs-target="#makerunModal"> <img src="../img/plus_button.png"
		style="width: 64px; height: 64px;">
	</a>

	<!-- The Modal -->
	<div class="modal fade" id="makerunModal" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id="modalheadText">번개런 등록</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<p id="modalbodyText">번개런을 등록하시겠습니까?</p>
					<form method="post" id="runWriteForm">
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
								<input type="hidden" name="ownerno" id="ownerno" value="" /> 
								<input type="hidden" name="type" id="type" value="번개런" />
								<input type="hidden" name="status" id="status" value='생성'/> 
								<ul>
									<li><input type="text" name="name" id="name"
										placeholder="최대 20자만 허용됩니다." /></li>
									<li><input type="date" name="runningdate" id="runningdate"
										placeholder="2025-02-19" /></li>
									<li><input type="text" name="runningcity" id="runningcity"
										value="서울시" /></li>
									<li><input type="text" name="region" id="region"
										placeholder="성동구" /></li>
									<li><input type="text" name="meetingpoint" id="meetingpoint"
										placeholder="성수역2번출구" /></li>
									<li><input type="time" name="runningtime" id="runningtime"
										placeholder="16:00" /></li>
									<li><input type="number" name="runmaxnum" id="runmaxnum"
										min="2" max="30" placeholder="최대 인원 수 30명" /></li>
								</ul>
							</div>
						</section>
						<div class="button-container">
							<input type="reset" class="btn btn-danger" id="rewriteInput"
								value="다시쓰기" /> <input type="submit" class="btn btn-warning"
								id="registerInput" value="등록" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="inforunModal" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">런 정보 상세 페이지</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- Modal body -->
				<div class="modal-body"></div>
			</div>
		</div>
	</div>

	
</div>
<script>
	const urlParams = new URLSearchParams(window.location.search);
	const no = urlParams.get('crewno');
	console.log("crewno->",no);
	if (no) {
		$.ajax({
             url: "${pageContext.request.contextPath}/run/ajaxgetCrewName?no=" + no,
             type: "GET",
             dataType: "text",
             success: function(name) {
                     console.log("받아온 크루 이름->",name);
                     document.getElementById('crewNameInput').value = name;
             },   error : function(e) {
                  console.log(e.responseText);
                  alert("크루 이름를 받지 못했습니다. 다시 진행해주세요.");
             }
     	});
	}

	const userStatus = <%= (userStatus != null) ? "\"" + userStatus + "\"" : "null" %>;
	const dateBtn = document.getElementById('dateBtn');
	const dayBtn = document.getElementById('dayBtn');
	const dateordayInput = document.getElementById('dateordayInput');
	const calendar = document.getElementById('calendar');
	const daySelect = document.getElementById('daySelect');
	const dateorday = document.getElementById('dateorday');
	const sidoInput = document.getElementById('sidoInput');
	const guInput = document.getElementById('guInput');
	const timeInput = document.getElementById('timeInput');
	const crewNameInput = document.getElementById('crewNameInput');
	const sidoSelect = document.getElementById('sidoSelect');
	const guSelect = document.getElementById('guSelect');
	const timeSelect = document.getElementById('timeSelect');
	const runForm = document.getElementById('runWriteForm');
	let isDataSelected = 0;
	var userno = parseInt('<%= userNo %>');
	
	console.log("userno->",userno);
	$(function() {
	//form의 데이터를 비동기식으로 서버로 보내 번개런 등록하기
		$("#runWriteForm").on('submit', function() {
					console.log("로그인 후 처음 번개런 등록");
					event.preventDefault();
						if (!runFormChk()) {
							return;
						}
						var ownerno=userno;
						$("#ownerno").val(ownerno);
												
						var url = "${pageContext.request.contextPath}/run/ajaxObject";
						var params = $("#runWriteForm").serialize();
						
						console.log(params);
						
						console.log("ownerno->",userno);
						if (confirm("번개런을 등록하시겠습니까?")) {
							$.ajax({
								url : url,
								data : params,
								type : "POST",
								success : function(response) {
										console.log(response);
										if (response.status == "success") {
											alert("번개런이 정상적으로 등록되었습니다.");
											var runningno = response.no;
											var owerno = userno;
											console.log("번개런 정상적으로 등록 후 자동 등록할 runningno->",runningno);
											if(runningno){
												$.ajax({
					                                url: "${pageContext.request.contextPath}/run/ajaxJoin?runningno=" + runningno + "&userno=" + userno,
					                                type: "GET",
					                                dataType: "json",
					                                success: function(runJoin) {
					                                		console.log("번개런 등록하면서 조인하기",runningno,userno);
					                                		$.ajax({
				                                                url: "${pageContext.request.contextPath}/run/ajaxcheckPersonNum?runningno=" + runningno,
				                                                type: "GET",
				                                                dataType: "json",
				                                                success: function(checkPersonNum) {
				                                                        console.log("참여 인원 체크할 runningno->",runningno);
				                                                        console.log("번개런 만들면서 자동으로 저장할 참여 인원 수:", checkPersonNum); // 콘솔에 참여 인원 수 출력
				                                                        var no = runningno;
				                                                        $.ajax({
				     		                                               url: "${pageContext.request.contextPath}/run/ajaxpersonNumInsert?no=" + no + "&joinednum=" + checkPersonNum,
				     		                                               type: "GET",
				     		                                               dataType: "json",
				     		                                               success: function(personNumInsert) {
				     		                                                       console.log("참여 인원 체크할 no->",no);
				     		                                                       console.log("번개런 만들고 갱신된 참여 인원 수 joinednum에 넣기->", checkPersonNum); // 콘솔에 참여 인원 수 출력
				     		                                                       $("#makerunModal").modal("hide");
				     		                                                      window.location.href = "${pageContext.request.contextPath}/run/runSearch";
				     		                                                       refreshRunList(); // 목록 새로고침 
				     		                                               },   error : function(e) {
				     		                                                   console.log(e.responseText);
				     		                                                   alert("참여 인원 수정하는중 오류가 발생했습니다. 다시 진행해주세요.");
				     		                                                   }
				     		                                                });
				                                                },   error : function(e) {
				                                                    console.log(e.responseText);
				                                                    alert("참여 인원 수정하는중 오류가 발생했습니다. 다시 진행해주세요.");
				                                                    }
				                                                 });
					                                },   error : function(e) {
					                                    console.log(e.responseText);
					                                    alert("오류가 발생했습니다. 다시 진행해주세요.");
					                                    }
					                                 });
												}
											} else if (response.status == "error") {
												alert("번개런 등록을 실패하였습니다.");
											} else {
												alert("알 수 없는 오류가 발생했습니다.");
											}
										}, error : function(e) {
											console.log(e.responseText);
											alert("서버 오류가 발생했습니다.");
										}
							
									});
								}
					});
		
		$("#runList").on('submit', function() {
			event.preventDefault();
			$.ajax({
				url : "${pageContext.request.contextPath}/run/ajaxList",
				data : $(this).serialize(),
				type : "GET",
				dataType : "json",
				success : function(response) {
					console.log("검색 색인으로 정리된 런 목록->", response);
					displayResult(response);
				},
				error : function(e) {
					console.log(e.responseText);
					alert("서버 오류가 발생했습니다.");
				}
			});
		});
	});

	function displayResult(response) { //each를 사용해서 인덱스된 리스트 디스플레이하기
		var rows=[];
		
		$("#view").empty();
		if (response && response.length > 0) {
			var completedRequests=0;
			var totalRequests = response.length;
			
			$.each(response, function(index, vo) {
				var row = "<tr><td>" + vo.no + "</td>";
				row += "<td>" + vo.runningdate + "</td>";
				row += "<td>" + vo.runningcity + "</td>";
				row += "<td>" + vo.region + "</td>";
				row += "<td>" + vo.runningtime + "</td>";
				row += "<td>" + vo.meetingpoint + "</td>";
				row += "<td>" + vo.type + "</td>";
				row += "<td>" + vo.joinednum + " / "
							+ vo.runmaxnum + "</td>";
						// 참석 여부에 따라 다른 이미지 표시
				// id가 없으면 안 하도록
				if (userStatus !== null && userStatus === 'Y') {
					$.ajax({
            			url:"${pageContext.request.contextPath}/run/ajaxcheckJoined?runningno=" + vo.no + "&userno=" + userno,
            			type:"GET",
            			dataType:"json",
            			success:function(checkJoined){
            				console.log(userno);
               				console.log("v아이콘 디스플레이용 참석 여부 확인 ajax->",checkJoined);
               				if(checkJoined){
            	   				row += "<td><img src='../img/vicon-blue.png' style='width:16px; height:16px;'></td>";
               				}else{
            	   				row += "<td></td>"; // 참석 정보가 없으면 빈 칸
               				}
               				row += "<td><a href='#' data-no='" + vo.no + "' data-bs-toggle='modal' data-bs-target='#runInfo'><img src='../img/vicon-red.png' style='width:16px; height:16px;'></a></td></tr>";
    						rows[index] = row;
    						completedRequests++;
    						if(completedRequests === totalRequests){
    							$("#view").append(rows.join(''));
    						}
            			}
            		});
				} else {
					row += "<td></td>";
       				row += "<td><a href='#' data-no='" + vo.no + "' data-bs-toggle='modal' data-bs-target='#runInfo'><img src='../img/vicon-red.png' style='width:16px; height:16px;'></a></td></tr>";
       				rows[index] = row;
       				completedRequests++;
					if(completedRequests === totalRequests){
						$("#view").append(rows.join(''));
					}
				}
			});
        } else {
	        var tag = "<tr><td colspan='10'>검색 결과가 없습니다.</td></tr></tbody></table>";
	        $("#view").append(tag);
        }
		$("#view").on("click", "a[data-no]", function(event) { 
				event.preventDefault();
				const no = $(this).data("no");
							
				$.ajax({
					url : "${pageContext.request.contextPath}/run/ajaxInfo?no="	+ no,
					type : "GET",
					dataType : "json",
					success : function(runInfo) {
							var runningno = runInfo.no;
							var ownerno = runInfo.ownerno;
							console.log("모달로 로드된 runningno->",runningno);
							console.log("모달로 로드된 ownerno->",ownerno);
							console.log("userno의 값->",userno);							
							console.log("모달로 로드한 런 정보->", runInfo);
							const modalBody = $("#inforunModal .modal-body");
							modalBody.empty();
							modalBody.append("<p><strong>런 이름 : </strong> " + runInfo.name + "</p>");
							modalBody.append("<p><strong>날짜 : </strong> " + runInfo.runningdate + "</p>");
							modalBody.append("<p><strong>시/도 : </strong> " + runInfo.runningcity + "</p>");
							modalBody.append("<p><strong>구 : </strong> " + runInfo.region + "</p>");
							modalBody.append("<p><strong>집결지 : </strong> " + runInfo.meetingpoint + "</p>");
							modalBody.append("<p><strong>집결시간 : </strong> "	+ runInfo.runningtime + "</p>");
							modalBody.append("<p><strong>타입 : </strong> " + runInfo.type + "</p>");
							modalBody.append("<p><strong>잔여인원 : </strong> " + runInfo.joinednum + " / " + runInfo.runmaxnum	+ "</p>");
							const editButton = $("<button>").text("수정").addClass("btn btn-primary").attr("data-runno", no);
							const deleteButton = $("<button>").text("삭제").addClass("btn btn-danger").attr("data-runno", no);
							const joinButton = $("<button>").text("참여").addClass("btn btn-warning").attr("id","joinButton").attr("data-runno", no);
							const buttonContainer = $("<div class='button-container'>").append(editButton).append(deleteButton).append(joinButton);
							
							$("#inforunModal").modal("show"); 
							
							if(userno===(runInfo.ownerno)){
								modalBody.append(buttonContainer);	
							}else{
								modalBody.append($("<div class='button-container'>").append(joinButton));
							}
							
							$.ajax({
			                    url:"${pageContext.request.contextPath}/run/ajaxcheckJoined?runningno=" + runningno + "&userno=" + userno,
			                    type:"GET",
			                    dataType:"json",
			                    success:function(checkJoined){
			                       console.log("참석 여부 확인->",checkJoined);
			                       if(checkJoined){
			                    	 joinButton.text("해제");
			                       }else{
			                      	 joinButton.text("참여"); 
			                       }
			                    }
			                    });
							
							//수정 버튼 클릭 처리
							editButton.click(function() {
									
									$.ajax({
										url : "${pageContext.request.contextPath}/run/ajaxInfo?no=" + no,
										type : "GET",
										dataType : "json",
										success : function(runInfo) {
											console.log("수정하려고 모달로 로드한 런 정보->", runInfo);
											$("#ownerno").val(runInfo.ownerno);
											$("#name").val(runInfo.name);
											$("#runningdate").val(runInfo.runningdate);
											$("#runningcity").val(runInfo.runningcity);
											$("#region").val(runInfo.region);
											$("#meetingpoint").val(runInfo.meetingpoint);
											$("#runningtime").val(runInfo.runningtime);
											$("#joinednum").val(runInfo.joinednum);
											$("#runmaxnum").val(runInfo.runmaxnum);
											$("#status").val("수정");
											$("#modalheadText").text("번개런 수정");
											$("#modalbodyText").text("번개런을 수정하시겠습니까?");
											$("#registerInput").val("수정"); 
											$("#inforunModal").modal("hide");
											$("#makerunModal").modal("show"); 
											$("#runWriteForm").off("submit").on("submit",function(event) {
												event.preventDefault();
												var params = $(this).serialize()+ "&no=" + no;
												console.log("처리된 데이터 확인->", params);
													$.ajax({
														url : "${pageContext.request.contextPath}/run/ajaxUpdate",
														data : params,
														type : "GET",
														dataType : "json",
														success : function(response) {
															if (response == 1) {
																alert("번개런 OK.");
																$("#makerunModal").modal("hide");
																resetMakerunModal();
																refreshRunList(); // 목록 새로고침
															} else {
																alert("번개런 NG.");
															}
													},	error : function(e) {
															console.log(e.responseText);
															alert("오류가 발생했습니다. 다시 진행해주세요.");
													}
												});
											});
										},	error : function(e) {
												console.log(e.responseText);
												alert("상세 정보를 가져오는데 실패했습니다.");
										}
									});
							});

							//삭제 버튼 클릭 처리
							deleteButton.click(function() {
								if (confirm("정말로 삭제하시겠습니까?")) {
									console.log("삭제할 runningno->",runningno);
									$.ajax({
										url : "${pageContext.request.contextPath}/run/ajaxparticipantsDelete?runningno=" + runningno,
										type : "GET",
										dataType : "json",
										success : function(response) {
											console.log("삭제할 런에 참여한 인원 삭제 후 나온 응답",response);
											console.log("삭제할 no->",no);
											$.ajax({
													url : "${pageContext.request.contextPath}/run/ajaxDelete?no=" + no,
													type : "GET",
													dataType : "json",
													success : function(response) {
														alert("번개런이 정상 삭제되었습니다.");
														$("#inforunModal").modal("hide"); // Changed to #runInfo
														refreshRunList(); // 목록 새로고침		
													},	error : function(e) {
														console.log(e.responseText);
														alert("번개런 삭제중 오류가 발생했습니다. 다시 진행해주세요.");
													}
												});
										},	error : function(e) {
												console.log(e.responseText);
												alert("참여자 목록 삭제중 오류가 발생했습니다. 다시 진행해주세요.");
											}
										});
									}
								});
								
							 //참석 버튼 클릭 처리
		                     joinButton.click(function() {
		                    	//var joinButton = $("joinButton");
		                        var runDate = new Date(runInfo.rundate);
		                        var now = new Date();
		          
		                        if(runDate <= now){
		                           joinButton.prop("disabled",true);
		                           alert("이미 시작되거나 지난 런은 참석할 수 없습니다.")
		                           return;
		                        }
		                        
		                        if(joinButton.text()=="참여"){
		                        	if (userStatus === null || userStatus !== 'Y') {

		                        		alert("로그인 후 사용 가능합니다.");
		                        		return;
		                        	}
		                        	if (confirm("예약하시겠습니까?")) {
		                        		var runningno = no;
		                           		console.log("참여 예약하는 runningno->",runningno);
		                           		console.log("참여 예약하는 userno->",userno);
		                          
		                          	if (runInfo.joinednum >= runInfo.runmaxnum) {
		                            	alert("정원이 초과되어 참석할 수 없습니다.");
		                                return;
		                            }else{
		                            	   	$.ajax({
		                                   		     url: "${pageContext.request.contextPath}/run/ajaxJoin?runningno=" + runningno + "&userno=" + userno,
		                                             type: "GET",
		                                             dataType: "json",
		                                             success: function(runJoin) {
		                                                     alert("정상 처리되었습니다.");
		                                                     /* $("#inforunModal").modal("hide"); */
		                                                     $.ajax({
		    		                                             url: "${pageContext.request.contextPath}/run/ajaxcheckPersonNum?runningno=" + runningno,
		    		                                             type: "GET",
		    		                                             dataType: "json",
		    		                                             success: function(checkPersonNum) {
		    		                                                     console.log("참여 인원 체크할 no->",no);
		    		                                                     console.log("참여 후 자동으로 저장할 참여 인원 수:", checkPersonNum); // 콘솔에 참여 인원 수 출력
		    		                                                     /* runInfo.joinednum = checkPersonNum; // runInfo 객체의 joinednum 속성에 값 할당 */
		    		                                                     $.ajax({
		    		 			                                            url: "${pageContext.request.contextPath}/run/ajaxpersonNumInsert?no=" + no + "&joinednum=" + checkPersonNum,
		    		 			                                            type: "GET",
		    		 			                                            dataType: "json",
		    		 			                                            success: function(personNumInsert) {
		    		 			                                                    console.log("!!!참여 인원 체크할 no->",no);
		    		 			                                                    console.log("!!!참석 후 갱신된 참여 인원 수 joinednum에 넣기->", checkPersonNum); // 콘솔에 참여 인원 수 출력
		    		 			                                                   $("#inforunModal").modal("hide"); // Changed to #runInfo
		    		 			                                                   refreshRunList(); // 목록 새로고침
		    		 			                                            },   error : function(e) {
		    		 				                                             console.log(e.responseText);
		    		 			                                                alert("참여 인원 수정하는중 오류가 발생했습니다. 다시 진행해주세요.");
		    		 			                                                }
		    		 			                                                });
		    		                                                },   error : function(e) {
		    		                                                    console.log(e.responseText);
		    		                                                    alert("참여 인원 수정하는중 오류가 발생했습니다. 다시 진행해주세요.");
		    		                                                    }
		    		                                                 });
		                                                },   error : function(e) {
		                                                    console.log(e.responseText);
		                                                    alert("오류가 발생했습니다. 다시 진행해주세요.");
		                                                    }
		                                                 });
		                                        }
		                        }
		                           }else if(joinButton.text()=="해제"){
		                        	   if (confirm("예약을 취소하시겠습니까?")){
		                        		   var runningno = no;
		                        		   console.log("참여 취소하는 runningno->",runningno);
			                           		console.log("참여 취소하는 userno->",userno);
		                        	 		$.ajax({
                                               url: "${pageContext.request.contextPath}/run/ajaxLeave?runningno=" + runningno + "&userno=" + userno,
                                               type: "GET",
                                               dataType: "json",
                                               success: function(runJoin) {
                                                       alert("정상 처리되었습니다.");
                                                       /* $("#inforunModal").modal("hide"); */
                                                       $.ajax({
                                                           url: "${pageContext.request.contextPath}/run/ajaxcheckPersonNum?runningno=" + runningno,
                                                           type: "GET",
                                                           dataType: "json",
                                                           success: function(checkPersonNum) {
                                                                   console.log("참여 인원 체크할 runningno->",runningno);
                                                                   console.log("예약 취소 후 저장할 참여 인원 수:", checkPersonNum); // 콘솔에 참여 인원 수 출력
                                                                   $.ajax({
                    	                                               url: "${pageContext.request.contextPath}/run/ajaxpersonNumInsert?no=" + no + "&joinednum=" + checkPersonNum,
                    	                                               type: "GET",
                    	                                               dataType: "json",
                    	                                               success: function(personNumInsert) {
                    	                                                       console.log("???참여 인원 체크할 run_no->",no);
                    	                                                       console.log("???예약 취소 후 갱신된 참여 인원 수 joinednum에 넣기->", checkPersonNum); // 콘솔에 참여 인원 수 출력
                    	                                                       $("#inforunModal").modal("hide"); // Changed to #runInfo
                    	                                                      refreshRunList(); // 목록 새로고침
                    	                                               },   error : function(e) {
                    	                                                   console.log(e.responseText);
                    	                                                   alert("참여 인원 수정하는중 오류가 발생했습니다. 다시 진행해주세요.");
                    	                                                   }
                    	                                                });
                                                           },   error : function(e) {
                                                               console.log(e.responseText);
                                                               alert("참여 인원 수정하는중 오류가 발생했습니다. 다시 진행해주세요.");
                                                               }
                                                            });
                                               },   error : function(e) {
                                                   console.log(e.responseText);
                                                   alert("오류가 발생했습니다. 다시 진행해주세요.");
                                                   }
                                                });
		                        	   }
		                           }
		                        });
		                     },   error : function(e) {
		                           console.error(e.responseText);
		                           alert("상세 정보를 가져오는데 실패했습니다.");
		                        }
		                  });
		               });
		         }
	
	function resetMakerunModal() { //makerunModal 초기화
        $("#name").val("");
        $("#runningdate").val("");
        $("#runningcity").val("서울시");
        $("#region").val("");
        $("#meetingpoint").val("");
        $("#runningtime").val("");
        $("#runmaxnum").val("");
        $("#status").val("생성");
        $("#modalheadText").text("번개런 등록");
        $("#modalbodyText").text("번개런을 등록하시겠습니까?");
        $("#registerInput").val("등록");
    }
	
	function refreshRunList() {
		console.log("리스트 새로 고침 완료!!");
        // AJAX를 사용하여 런 목록을 다시 가져오는 코드
        $.ajax({
            url: "${pageContext.request.contextPath}/run/ajaxList",
            type: "GET",
            dataType: "json",
            success: function(response) {
                displayResult(response);
            },	error: function(e) {
                console.log(e.responseText);
                alert("목록 새로고침 실패.");
            }
         });
    }

	function runFormChk() {
		if (document.getElementById("name").value === "") {
			alert("번개런 이름을 입력하세요")
			return false;
		} else if (document.getElementById("runningdate").value === "") {
			alert("날짜를 입력하세요")
			return false;
		} else if (document.getElementById("runningcity").value === "") {
			alert("지역(시/도)을 입력하세요")
			return false;
		} else if (document.getElementById("region").value === "") {
			alert("지역(구/군)을 입력하세요")
			return false;
		} else if (document.getElementById("meetingpoint").value === "") {
			alert("집결지를 입력하세요")
			return false;
		} else if (document.getElementById("runningtime").value === "") {
			alert("집결시간을 입력하세요")
			return false;
		} else if (document.getElementById("runmaxnum").value === "") {
			alert("최대인원을 입력하세요")
			return false;
		}
		return true;
	}

	dateBtn.addEventListener('click', function() {
		isDataSelected = 0;
		dateordayInput.type = "date";
		dateordayInput.name = "searchDate";
		daySelect.style.display = "none";
	});

	dayBtn.addEventListener('click', function() {
		isDataSelected = 1;
		dateordayInput.type = "text";
		dateordayInput.name = "searchDay";
		dateordayInput.placeholder = "요일";
		daySelect.style.display = "none";
	});

	daySelect.addEventListener('change', function(event) {
		const day = event.target.value;
		console.log("선택된 요일:", day);
		dateordayInput.value = day;
		daySelect.style.display = "none";
	});

	function updateInputText(input, select) {
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
		if (isDataSelected == 1)
			daySelect.style.display = "block";
		else
			daySelect.style.display = "none";
	});

	dateorday.addEventListener('mouseleave', function() {
		daySelect.style.display = "none";
	});
</script>


