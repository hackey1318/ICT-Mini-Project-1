<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<style>
.sideBar{
	width:200px;
	position:fixed;
	left:80px;
	top:50%;
	color : black;
	z-index:100;
}
</style>


<div class="sideBar">
	<div class="btn-group-vertical">
		<!-- ///////////////신청내역 button/////////////// -->
	    <button type="button" 
	    		class="btn btn-outline-secondary"
	    		onclick = "location.href = '#'"
	    >신청내역</button>
	    
	    <!-- ///////////////개인정보수정 button/////////////// -->
	    <button type="button"
	    		class="btn btn-outline-secondary"
	    		onclick = "location.href = '#'"
	    >개인정보수정</button>
	    		
	   	<!-- ///////////////크루생성 button/////////////// -->
	    <button type="button"
	    		class="btn btn-outline-secondary"
	    		onclick = "openCrewCreateModal()"
	    >크루생성</button>
	    
	    <!-- ///////////////크루관리 button/////////////// -->
	    <button type="button" 
	    		class="btn btn-outline-secondary"
	    		onclick = "location.href = '#'"
	   	>크루관리</button>
	    
	    <!-- ///////////////회원탈퇴 button/////////////// -->
	    <button type="button" 
	    		class="btn btn-outline-secondary"
	    		onclick = "location.href = '#'"
	    >회원탈퇴</button>
	  </div>
</div>