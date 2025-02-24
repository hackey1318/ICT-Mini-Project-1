//회원가입 유효성 검사 아이디 중복검사(비동기식으로 구현)
function signinCheck(){
    let userid = document.getElementById("userid").value.trim();
    if(userid == ""){
        alert("아이디를 입력하세요.");
        return false;
    }

    //비밀번호
    let userpwd = document.getElementById("userpwd").value.trim();
    let pwd2 = document.getElementById("pwd2").value.trim();
    let pwdReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
    if (!pwdReg.test(userpwd)) {
        alert("비밀번호는 8~16자이며, 영문 대소문자, 숫자, 특수문자(!@#$%^&*)를 포함해야 합니다.");
        return false;
    }
    if(userpwd !== pwd2){
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }

     //이름
    let username = document.getElementById("username").value.trim();
    let nameReg = /^[가-힣]{2,8}$/;

    if(username === "") {
        alert("이름을 입력하세요.");
        return false;
    } else if (!nameReg.test(username)) {
        alert("이름은 2~8자 사이의 한글만 사용 가능합니다. \n다시 입력해주세요.")
        return false;
    }
    //닉네임
    let userNickname = document.getElementById("userNickname").value.trim();
    let nickNameReg = /^[A-Za-z0-9가-힣]{2,10}$/;

    if(userNickname === ""){
        alert("닉네임을 입력하세요.");
        return false;
    } else if (!nickNameReg.test(userNickname)){
        alert("닉네임은 2~10자 사이의 영어 대소문자, 한글, 숫자만 사용 가능합니다.\n다시 입력해주세요.");
    }

    //이메일
    let email = document.getElementById("email").value.trim();
    let emailReg = /^\w{3,10}@[A-Za-z0-9]{2,8}[.][a-z]{2,4}([.][a-z]{2,3})?$/;

    if(email === "") {
        alert("이메일을 입력하세요.");
        return false;
    } else if(!emailReg.test(email)) {
        alert("유효한 이메일 주소를 입력하세요.");
        return false;
    }

    //연락처
    let tel = document.getElementById("tel2").value.trim() + "-";
    tel += document.getElementById("tel3").value.trim();
    let telReg = /^[0-9]{3,4}[-][0-9]{4}$/;

    if (!telReg.test(tel)) {
        alert("휴대폰 번호를 정확히 입력해주세요.")
        return false;
    }

    //우편번호
    let zipcode = document.getElementById("zipcode").value.trim();
    if(zipcode === ""){
        alert("우편번호를 입력해주세요.");
        return false;
    }

    //생년월일
    let birthdate = document.getElementById("birthdate").value;
    if(!birthdate){
        alert("생년월일을 입력해주세요.");
        return false;
    }

    //성별
    let gender = document.querySelector('input[name="gender"]:checked');
    if(!gender){
        alert("성별을 선택해주세요.");
        return false;
    }

    return true;
}

function idDuplicateStatus() {
    document.getElementById("idCheck").textContent = ""; // 중복 체크 메시지 초기화
    document.getElementById("idCheckStatus").value = "N"; // 중복 확인 상태 초기화
}

function idDuplicate() {
    let userId = document.getElementById("userid").value.trim();
    
    if (userId === "") {
        alert("아이디를 입력하세요.");
        return;
    }

    // 아이디 정규식 검사 (5~10자, 영문자로 시작, 영문자/숫자/_/$ 허용)
    let idReg = /^[A-Za-z]{1}[A-Za-z0-9_$]{4,9}$/;
    if (!idReg.test(userId)) {
        alert("아이디는 영문자로 시작하며, 5~10자 내에서 영문자, 숫자, _, $만 사용 가능합니다.");
        return;
    }

    // 서버로 중복 확인 요청 (AJAX)
    fetch('/rs/users/checkId?userId=' + encodeURIComponent(userId)) // 서버에서 `/checkId` 엔드포인트로 요청
        .then(response => response.json())
        .then(data => {
            if (data) {
                document.getElementById("idCheck").textContent = "이미 사용 중인 아이디입니다.";
                document.getElementById("idCheckStatus").value = "N"; // 중복된 상태
            } else {
                document.getElementById("idCheck").textContent = "사용 가능한 아이디입니다.";
                document.getElementById("idCheckStatus").value = "Y"; // 사용 가능 상태
            }
        })
        .catch(error => console.error("Error:", error));
}