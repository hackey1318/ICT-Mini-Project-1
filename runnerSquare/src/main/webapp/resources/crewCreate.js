function openCrewCreateModal() {
	document.getElementsByClassName("modal-content")[0].innerHTML = `
		<div class="modal-header">
		  <h4 class="modal-title">크루 생성</h4>
		  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		</div>
		
		<div class="modal-body">
			<form method="POST" id="crewForm" onsubmit="return handleFormSubmit(event);">
				<input type="hidden" name="status" value="active"/>

				<label>크루명</label>
				<input type="text" id="crewName" name="name"/>
				<div class="alert"></div>

				<label>활동지역</label>
				<div class="locationGroup">
			        <select id="citySelect" name="city" onchange="changeState()">
			            <option value="">시/도</option>
			        </select>
			        <select id="districtSelect" name="district">
			            <option value="">시/군/구</option>
			        </select>
			    </div>
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
				</div>
				<div class="alert"></div>

				<label>크루소개</label>
				<textarea id="description" name="description"></textarea>
				<div class="alert"></div>

				<label>크루사진</label>
				<input type="file" id="crewImage" name="crewImage"/>

				<input type="submit" id="submit-button" value="크루생성"/>
			</form>

		</div>
	`;
	makeSel();
	document.getElementById('citySelect').value = '';

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

function handleFormSubmit(event) {
    event.preventDefault();

    if (!crewFormCheck()) {
        return false;
    }

    const formData = new FormData(document.getElementById("crewForm"));

	console.log(formData);

	// 크루 생성 param -> createCrew
	const crewParams = {
		name: formData.get('name'),
		city: formData.get('city'),
		district: formData.get('district'),
		runningDay: formData.get('runningDay'),
		description: formData.get('description')
	}

    let day = [];
    document.querySelectorAll('input[name="runningDay"]:checked').forEach((checkbox) => {
        day.push(checkbox.value);
    });
    if (day.length > 0) {
        crewParams["runningDay"] = day.join(",");
    }

    formData.forEach((value, key) => {
        if (key !== 'runningDay') {
			if (typeof value === 'string') {
				crewParams[key] = value.trim();
			} else {
				crewParams[key] = value;
			}
		}
    });

	console.log(crewParams);

	const imageParams = {
		files: formData.get('crewImage')
	}

	console.log(imageParams);
	
	// file upload 실행
	
	// response 정보에서 imageId를 추출
	// param의 imageIdList에 추가
	
	// const logofile = {	// fileupload
	// 	files: formData.get('files')
	// }

	// const activeFiles = { // fileupload
	// 	files: formData.get('activeFiles')
	// }

	// response crewPhoto
	
    // AJAX 요청
    $.ajax({
        url: 'crewCreateOk', // 서버 URL
		type: 'POST',  // HTTP 메서드 (POST)
		contentType: 'application/json',  // 서버에 JSON으로 전송
        data: JSON.stringify(crewParams),  // 데이터를 JSON 문자열로 직렬화
        success: function(results) {
            if (results == "1") {
            	// crewJoin 실행
                var myModal = new bootstrap.Modal(document.getElementById('crewModal'));
            	myModal.hide();  // 모달 닫기 // 적용이 안됨
				inputLogo(imageParams); // db에 사진 추가
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

function inputLogo(imageParams) {
	$.ajax({
        url: '', // 서버 URL
		type: '',  // HTTP 메서드 (POST)
		contentType: '',  // 서버에 JSON으로 전송
        data: JSON.stringify(),  // 데이터를 JSON 문자열로 직렬화
        success: function(results) {
            if (results == "1") {
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