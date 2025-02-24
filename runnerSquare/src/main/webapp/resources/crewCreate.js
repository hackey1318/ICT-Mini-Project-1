function openCrewCreateModal() {
	document.getElementsByClassName("modal-content")[0].innerHTML = `
		<div class="modal-header">
		  <h4 class="modal-title">크루 생성</h4>
		  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		</div>
		
		<div class="modal-body">
			<form method="POST" id="crewForm" onsubmit="return handleFormSubmit(event);">
				<input type="hidden" name="status" value="승인대기"/>

				<label>크루명</label>
				<input type="text" id="crewName" name="name"/>
				<div class="alert"></div>

				<label>활동지역</label>
				<select id="citySelect" name="city" onchange="changeState()">
				    <option value="">시/도</option>
				</select>
				<select id="districtSelect" name="district">
				    <option value="">시/군/구</option>
				</select>
				<div class="alert"></div>

				<label>러닝일</label>
				<div id="dayCheckBox">
					<input type="checkbox" value="월" name="runningDay"/>월
					<input type="checkbox" value="화" name="runningDay"/>화
					<input type="checkbox" value="수" name="runningDay"/>수
					<input type="checkbox" value="목" name="runningDay"/>목
					<input type="checkbox" value="금" name="runningDay"/>금
					<input type="checkbox" value="토" name="runningDay"/>토
					<input type="checkbox" value="일" name="runningDay"/>일
				</div><br/>
				<div class="alert"></div>

				<label>크루소개</label>
				<textarea id="description" name="description"></textarea>
				<div class="alert"></div>
				
				// 크루 로고
				// 크루 사진 등록 기능 추가 필요<br/>
				
				<form id="uploadForm" method="post" enctype="multipart/form-data" action="">
					<label>크루사진</label>
					<input type="file" id="crewImage" multiple/>
				</form>

				<div><input type="submit" id="submit-button" value="크루생성"/></div>
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
			console.log(element);
			console.log(element.value);
		});
	});

}

function handleFormSubmit(event) {
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
	
	// file upload 실행
	
	// response 정보에서 imageId를 추출
	// param의 imageIdList에 추가
	
    // AJAX 요청
    $.ajax({
        url: 'crewCreateOk', // 서버 URL
		type: 'POST',  // HTTP 메서드 (POST)
		contentType: 'application/json',  // 서버에 JSON으로 전송
        data: JSON.stringify(params),  // 데이터를 JSON 문자열로 직렬화
        success: function(results) {
			console.log(results);
            if (results == "1") {
                // document.getElementById('crewModal').hide(); // 적용이 안 됨...
				alert('크루 생성 완료');
            } else {
                alert('크루 생성 실패');
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