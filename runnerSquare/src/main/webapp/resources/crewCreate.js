var myModal;  // 전역에서 선언

function openCrewCreateModal() {

	myModal = new bootstrap.Modal(document.getElementById('crewModal'));
	myModal.show();

	document.getElementsByClassName("modal-content")[0].innerHTML = `
		<div class="modal-header">
		  <h4 class="modal-title">크루 생성</h4>
		  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		</div>
		
		<div class="modal-body">
            <form method="POST" id="crewForm" onsubmit="return handleFormSubmit(event);" enctype="multipart/form-data">
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

				<label>크루로고</label>
				<input type="file" id="crewLogo" name="crewLogo"/>

				<label>크루활동 사진</label>
				<input type="file" id="crewActive" name="crewActive" multiple/>

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

async function handleFormSubmit(event) {
    event.preventDefault();
    if (!crewFormCheck()) {
        return false;
    }

    const formData = new FormData(document.getElementById("crewForm"));

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

    try {
        const crewRes = await fetch('/rs/crew/crewCreateOk', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(crewParams)
        });

        const crewData = await crewRes.json();

        if (!crewData || !crewData.no) {
            throw new Error('크루 정보를 저장하는 데 실패했습니다.');
        }

        crewJoin('leader', crewData.no);

        const logoFormData = new FormData();
        logoFormData.append("files", document.querySelector("#crewLogo").files[0]);

        const logoRes = await fetch('/rs/file-system/upload', {
            method: 'POST',
            body: logoFormData
        });

        const logoData = await logoRes.json();

        if (!logoData || logoData.length === 0) {
            throw new Error('로고 파일 업로드에 실패했습니다.');
        }
        const imageIdList = logoData.map(item => item.imageId);

        const logoCrewPhoto = {
            crewNo: crewData.no,
            imageIdList: imageIdList,
            type: 'logo',
            status: 'active'
        };

        // 로고 등록 요청
        const logoResponse = await fetch('/rs/crew/crewPhoto', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(logoCrewPhoto)
        });

        const logoResponseData = await logoResponse.json();

        if (!logoResponseData) {
            throw new Error('로고 사진 등록에 실패했습니다.');
        }

        const activeFileInput = document.querySelector("#crewActive");
        let activeRes = null;

        // 활동 사진이 선택된 경우에만 업로드
        if (activeFileInput.files.length > 0) {
            const activeFormData = new FormData();
            for (const file of activeFileInput.files) {
                activeFormData.append("files", file);
            }

            try {
                // 활동 사진 파일 업로드 요청
                activeRes = await fetch('/rs/file-system/upload', {
                    method: 'POST',
                    body: activeFormData
                });

                if (activeRes) {

                    const activeData = await activeRes.json();

                    // 응답이 없거나 빈 배열일 경우 에러 처리
                    if (!activeData || activeData.length === 0) {
                        throw new Error('활동 사진 파일 업로드에 실패했습니다.');
                    }
                    const activeImageList = activeData.map(item => item.imageId);

                    const activeCrewPhoto = {
                        crewNo: crewData.no,
                        imageIdList: activeImageList,
                        type: 'activeHistory',
                        status: 'active'
                    };

                    const activeResponse = await fetch('/rs/crew/crewPhoto', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify(activeCrewPhoto)
                    });

                    const activeResponseData = await activeResponse.json();

                    if (!activeResponseData) {
                        throw new Error('활동 사진 등록에 실패했습니다.');
                    }
                }

            } catch (error) {
                console.error('활동 사진 업로드 에러:', error);
                alert('활동 사진 파일 업로드에 실패했습니다.');
            }
        }

        // 모달 닫기
        myModal.hide();

        // 남아있는 backdrop 제거
        setTimeout(() => {
            document.querySelectorAll('.modal-backdrop').forEach(backdrop => backdrop.remove());
            document.body.classList.remove('modal-open');
            document.body.style.overflow = '';
        }, 300);

    } catch (error) {
        console.error('Error:', error);
        alert('서버 통신에 문제가 발생했습니다.');
    }
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