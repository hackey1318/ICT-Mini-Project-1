document.addEventListener("DOMContentLoaded", () => {
    
    //
    // 로그인
    //
    
    //로그인 다이얼로그 변수 선언
    const LoginDialog = document.getElementById('loginDialog');
    const openDialogLink = document.getElementById('openLogDialog');
    const closeLoginDialogBtn = document.getElementById('closeLoginDialog');

    // a태그 클릭 시 다이얼로그 열기
    openDialogLink.addEventListener('click', (event)=>{
        event.preventDefault(); // a 태그 이벤트 없앰
        LoginDialog.showModal();
    });
    // 다이얼로그 닫기
    closeLoginDialogBtn.addEventListener('click', ()=>{
        LoginDialog.close();
    });


    //
    // 회원가입입
    //

    //회원가입 다이얼로그 관련 변수 선언
    const signInDialog = document.getElementById('signinDialog');
    const openSignInDialogLink = document.getElementById('openSignInDialog');
    const closeSignInDialogBtn = document.getElementById('closeSigninDialog');

    //회원가입 a 태그 클릭 시 다이얼로그 열기
    openSignInDialogLink.addEventListener('click', (event) => {
        event.preventDefault();
        signInDialog.showModal();
    });

    //회원가입 다이얼로그 닫기 버튼
    closeSignInDialogBtn.addEventListener('click', () => {
        signInDialog.close();
    })

    // 로그인에서 회원가입 이동
    document.getElementById("openSignInDialogFromLogin").addEventListener("click", (event) => {
        event.preventDefault();
        loginDialog.close();
        signInDialog.showModal();
    });

    //
    // 아이디 찾기
    //
    
    //아이디 찾기 다이얼로그 변수
    const findIdDialog = document.getElementById('findIdDialog');
    const openFindIdDialog = document.getElementById('findId');
    const closeFindDialog = document.getElementById('closeFindIdDialog');

    // 아이디 찾기 다이얼로그 열기/닫기 이벤트
    openFindIdDialog.addEventListener('click', (event) => {
        event.preventDefault();
        findIdDialog.showModal();
    });
    closeFindDialog.addEventListener('click', () => {
        findIdDialog.close();
    });

    //
    // 비밀번호 찾기
    //

    //비밀번호 찾기 다이얼로그 변수
    const findPwdDialog = document.getElementById('findPwdDialog');
    const openFindPwdDialog = document.getElementById('findPwd');
    const closeFindPwdDialog = document.getElementById('closeFindPwdDialog');

    // 비밀번호 찾기 모달 열기/닫기 이벤트
    openFindPwdDialog.addEventListener('click', () => {
        event.preventDefault();
        findPwdDialog.showModal();
    });
    closeFindPwdDialog.addEventListener('click', () => {
        findPwdDialog.close();
    });
});