<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/citySelect.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/crewCreate.js"></script>
<link href="${pageContext.request.contextPath}/resources/crewCreate.css" rel="stylesheet" type="text/css"/>

<div class="body">
	<button type="button" id="modal-button" data-bs-toggle="modal" data-bs-target="#crewModal"
		onclick="openCrewCreateModal();">크루생성</button>
	
	<div class="modal fade" id="crewModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
			</div>
		</div>
	</div>
</div>