<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js_css/crewCreate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js_css/citySelect.js"></script>
<link href="${pageContext.request.contextPath}/js_css/crewCreate.css" rel="stylesheet" type="text/css"/>

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