var myModal;

function openCrewUpdateModal(crewData) {

    // 모달을 생성하고 표시
    myModal = new bootstrap.Modal(document.getElementById('crewModal'));
    myModal.show();

    // modal-content의 HTML을 동적으로 수정
    document.getElementsByClassName("modal-content")[0].innerHTML = `
        <div class="modal-header">
            <h4 class="modal-title">크루 수정</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <div class="modal-body">
            <form method="POST" id="crewForm" onsubmit="return updateHandleFormSubmit(event);" enctype="multipart/form-data">
                <input type="hidden" name="status" value="${crewData.status}"/>
                <input type="hidden" name="no" value="${crewData.no}"/>

                <label>크루명</label>
                <input type="text" id="crewName" name="name" value="${crewData.name}"/>
                <div class="alert"></div>

                <label>활동지역</label>
	                <div class="locationGroup">
		                <select id="citySelect" name="city" onchange="changeState()">
		                    <option value="">시/도</option>
		                    <option value="${crewData.city}" selected>${crewData.city}</option>
		                </select>
		                <select id="districtSelect" name="district">
		                    <option value="">시/군/구</option>
		                    <option value="${crewData.district}" selected>${crewData.district}</option>
		                </select>
	                </div>
                <div class="alert"></div>

                <label>러닝일</label>
                <div id="dayCheckBox">
                    <input type="checkbox" value="월" name="runningDay" ${crewData.runningDay.includes('월') ? 'checked' : ''}/>월
                    <input type="checkbox" value="화" name="runningDay" ${crewData.runningDay.includes('화') ? 'checked' : ''}/>화
                    <input type="checkbox" value="수" name="runningDay" ${crewData.runningDay.includes('수') ? 'checked' : ''}/>수
                    <input type="checkbox" value="목" name="runningDay" ${crewData.runningDay.includes('목') ? 'checked' : ''}/>목
                    <input type="checkbox" value="금" name="runningDay" ${crewData.runningDay.includes('금') ? 'checked' : ''}/>금
                    <input type="checkbox" value="토" name="runningDay" ${crewData.runningDay.includes('토') ? 'checked' : ''}/>토
                    <input type="checkbox" value="일" name="runningDay" ${crewData.runningDay.includes('일') ? 'checked' : ''}/>일
                </div>
                <div class="alert"></div>

                <label>크루소개</label>
                <textarea id="description" name="description">${crewData.description}</textarea>
                <div class="alert"></div>

                <input type="submit" id="submit-button" value="크루수정"/>
            </form>
        </div>
    `;
	makeSel();
	
	const formElements = document.querySelectorAll(
		'#crewForm input[type="text"], #crewForm input[type="checkbox"], #crewForm select, #crewForm textarea'
	);

	formElements.forEach(function(element) {
		element.addEventListener("input", function() {
			if (element.value == null || element.value == "") {
				crewFormCheck();
			} else {
				setAlert(-1);
			}
		});
	});
	
}

function updateHandleFormSubmit(event) {
    event.preventDefault();

    if (!crewFormCheck()) {
        return false;
    }

    const formData = new FormData(document.getElementById("crewForm"));
    const params = {};
    let day = [];
    document.querySelectorAll('input[name="runningDay"]:checked').forEach((checkbox) => {
        day.push(checkbox.value);
    });
    if (day.length > 0) {
        params["runningDay"] = day.join(",");
    }

    formData.forEach((value, key) => {
        if (key !== 'runningDay') {
			if (typeof value === 'string') {
				params[key] = value.trim();
			} else {
				params[key] = value;
			}
		}
    });

	console.log(params);

    // AJAX 요청
    $.ajax({
        url: 'crewUpdateOk', // 서버 URL
		type: 'POST',  // HTTP 메서드 (POST)
		contentType: 'application/json',  // 서버에 JSON으로 전송
        data: JSON.stringify(params),  // 데이터를 JSON 문자열로 직렬화
        success: function(results) {
			console.log(results);
            if (results == "1") {
                myModal.hide();
				location.reload();
				alert('크루 수정 완료');
            } else {
                alert('크루 수정 실패');
            }
        },
        error: function(error) {
            console.error('Error:', error);
            alert('서버 통신에 문제가 발생했습니다.');
        }
    });
}

function crewFormCheck() {
    var runningDayCheckboxes = document.getElementsByName("runningDay");
    let isRunningDayChecked = false;
    
    // '러닝일' 체크박스가 하나라도 선택된 경우, isRunningDayChecked를 true로 설정
    for (let i = 0; i < runningDayCheckboxes.length; i++) {
        if (runningDayCheckboxes[i].checked) {
            isRunningDayChecked = true;
            break;
        }
    }

	if (crewName.value.trim() == "") {
		setAlert(0);
		return false;
	} else if (citySelect.value == "" || districtSelect.value == "") {
		setAlert(1);
		return false;
	} else if (!isRunningDayChecked) {
		setAlert(2);
		return false;
	} else if (description.value.trim() == "") {
		setAlert(3);
		return false;
	}
	return true;
}

function setAlert(i) {
	let alertArr = document.getElementsByClassName("alert");
	let textArr = ["크루명을 입력", "활동지역을 선택", "러닝일을 선택", "크루소개를 입력"];

	for (var j = 0; j < 4; j++) {
		alertArr[j].style.display = "none";
	}
	if (i == -1) return;

	alertArr[i].innerText = textArr[i] + "하세요.";
	alertArr[i].style.display = "block";
}