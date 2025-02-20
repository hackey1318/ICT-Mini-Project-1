function openCrewCreateModal() {
	document.getElementsByClassName("modal-content")[0].innerHTML = `
		<div class="modal-header">
		  <h4 class="modal-title">크루 생성</h4>
		  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		</div>
		
		<div class="modal-body">
			<form method="post" action="<%=request.getContextPath()%>/crew/crewCreateOk" onsubmit="return crewFormCheck();">
				<label>크루명</label>
				<input type="text" id="crewName" name="crewName"/><div class="alert"></div>
				<label>활동지역</label>
				<input type="text" id="activeArea" name="activeArea"/><br/><div class="alert"></div>
				<label>러닝일</label>
				<input type="text" id="runningDay" name="runningDay"/><br/><div class="alert"></div>
				<label>크루소개</label>
				<textarea id="description" name="description"></textarea><br/><div class="alert"></div>
				<label>크루사진</label>
				<input type="file" id="crewImage", name="crewImage"/><br/>
				<div><input type="submit" id="submit-button" value="크루생성"/></div>
			</form>
		</div>
		`;
	}
	
	function crewFormCheck() {
	let alertArr = document.getElementsByClassName("alert");
	let idArr = ["crewName", "activeArea", "runningDay", "description"];
	let textArr = ["크루명", "활동지역", "러닝일", "크루소개"];
	
	for (var i = 0; i < idArr.length; i++) {
		var text = (textArr[i] == "크루소개") ? "를" : "을";
		if (document.getElementById(idArr[i]).value.trim() == "") { // trim() 적용 안되는 문제 해결해야 함..
            alertArr[i].innerText = textArr[i] + text + " 입력하세요.";
            alertArr[i].style.display = "block";
            return false;
		}
	}
    return true;
}