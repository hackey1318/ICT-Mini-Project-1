<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewUpdate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/citySelect.js"></script>
<link href="${pageContext.request.contextPath}/resources/crewCreate.css" rel="stylesheet" type="text/css"/>

<script>
const crewData = {
		name: "${vo.name}",
		city: "${vo.city}",
		district: "${vo.district}",
		runningDays: "${vo.runningDay}",
		description: "${vo.description}",
		no: "${vo.no}",
		status: "${vo.status}"
	};
	console.log(crewData);
	
	function delCheck() {
		// alert, confirm(y, m), prompt(value)
		if (confirm ("크루를 삭제하시겠습니까?")) { // 확인: true->삭제
			location.href="${pageContext.request.contextPath}/crew/crewDelete?crew_no=${vo.no}";
		}
	}

</script>

<div class="main-container">
	<button type="button" id="modal-button" data-bs-toggle="modal" data-bs-target="#crewModal"
		onclick="openCrewUpdateModal();">크루 수정</button>
	
	<div class="modal fade" id="crewModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
			</div>
		</div>
	</div>
	<a href="javascript:delCheck()">삭제</a>
</div>

