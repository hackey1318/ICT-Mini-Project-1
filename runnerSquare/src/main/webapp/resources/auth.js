// form 값 유효성검사
function formCheck(){
    let userId = document.getElementById("id").value.trim();
    let userPwd = document.getElementById("pw").value.trim();

    //id,pwd 입력 유무 확인
    if(userId === ""){
        alert("아이디를 입력해주세요.");
        return false;
    }

    if(userPwd === ""){
        alert("비밀번호를 입력해주세요.");
        return false;
    }

    //아이디: 5~10자 사이(첫 번째 문자는 영어 대소문자 영대소문자, 숫자,_,$)
    let idReg = /^[A-Za-z]{1}[A-Za-z0-9_$]{4,9}$/;
    if (!idReg.test(userId)) {
        alert("아이디 첫 번째 글자는 영어 대소문자\n영어 대소문자, 숫자, 특수문자(_, $)만 허용\n글자 길이는 5~10글자");
        return false;
    }

    //비밀번호:8~16자(최소 하나의 영문 대소문자, 숫자, 특수문자(!@#$%^&*) 포함)
    let pwdReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
    if (!pwdReg.test(userPwd)) {
        alert("비밀번호는 8~16자이며, 영문 대소문자, 숫자, 특수문자(!@#$%^&*)를 포함해야 합니다.");
        return false;
    }

    return true;
}

// 우편번호 찾기
// https://postcode.map.daum.net/guide
function daumPostCodeSearch(){
    new daum.Postcode({
        oncomplete: function(data) {
            // console.log(data);
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addrDetail").focus();
        }
    }).open();
}

document.querySelector('.login-form').addEventListener('submit', function(e){
    e.preventDefault();

    var formData = new FormData(this);

    fetch('/users/loginOk', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data && data.id) {
            // 로그인 성공
            document.getElementById('loginDialog').close(); // 로그인 다이얼로그 닫기
            updateHeader(data.name); // 헤더 업데이트
        } else {
            // 로그인 실패
            alert('로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.');
        }
    })
    .catch(error => console.error('Error:', error));
});

function updateHeader(userName) {
    var header = document.querySelector('header');
    header.innerHTML = `
        <span>${userName}님, 환영합니다</span> |
        <a href="#" id="logoutLink">로그아웃</a>
    `;

    document.getElementById('logoutLink').addEventListener('click', function(event) {
        event.preventDefault();
        fetch("/logout", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            }
        })
        .then(response => {
            if (response.ok) {
                // 로그아웃 성공 시 UI 업데이트
                document.getElementById("signinDialog").close();
                document.getElementById("header").innerHTML = `
                    <button id="loginButton">로그인</button>
                    <button id="signupButton">회원가입</button>
                `;

                // 로그인 다이얼로그 열기 이벤트 리스너 재설정
                document.getElementById('openLoginDialog').addEventListener('click', function(event) {
                    event.preventDefault();
                    document.getElementById('loginDialog').showModal();
                });
                // 회원가입 다이얼로그 열기 이벤트 리스너 재설정
                document.getElementById('openSignInDialog').addEventListener('click', function(event) {
                    event.preventDefault();
                    document.getElementById('signinDialog').showModal();
                });
            } else {
                console.error("로그아웃 실패");
            }
        })
        .catch(error => console.error("에러 발생:", error));
    });
}