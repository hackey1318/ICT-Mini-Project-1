document.addEventListener("DOMContentLoaded", function() {
    
    //
    // 로그인
    //
    
    //로그인 다이얼로그 변수 선언
    const LoginDialog = document.getElementById('loginDialog');
    const openLoginDialog = document.getElementById('openLoginDialog');
    const closeLoginDialogBtn = document.getElementById('closeLoginDialog');

    // a태그 클릭 시 다이얼로그 열기
    if (openLoginDialog) {
        openLoginDialog.addEventListener('click', (event)=>{
            event.preventDefault(); // a 태그 이벤트 없앰
            LoginDialog.showModal();
        });
    } else {
        console.error('openLoginDialog 요소를 찾을 수 없습니다.');
    }
    
    // 다이얼로그 닫기
    if (closeLoginDialogBtn) {
        closeLoginDialogBtn.addEventListener('click', ()=>{
            LoginDialog.close();
        });
    } else {
        console.error('closeLoginDialog 요소를 찾을 수 없습니다.');
    }

    //
    // 회원가입
    //

    //회원가입 다이얼로그 관련 변수 선언
    const signInDialog = document.getElementById('signinDialog');
    const openSignInDialogLink = document.getElementById('openSignInDialog');
    const closeSignInDialogBtn = document.getElementById('closeSigninDialog');

    //회원가입 a 태그 클릭 시 다이얼로그 열기
    if (openSignInDialogLink) {
    	openSignInDialogLink.addEventListener('click', (event) => {
    	    event.preventDefault();
    	    signInDialog.showModal();
    	});
    } else {
        console.error('openSignInDialogLink 요소를 찾을 수 없습니다.');
    }

    //회원가입 다이얼로그 닫기 버튼
    if (closeSignInDialogBtn) {
        closeSignInDialogBtn.addEventListener('click', () => {
            signInDialog.close();
        });
    } else {
        console.error('closeSignInDialogBtn 요소를 찾을 수 없습니다.');
    }

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

    if (openFindIdDialog) {
        openFindIdDialog.addEventListener('click', (event) => {
            event.preventDefault();
            findIdDialog.showModal();
        });
    } else {
        console.error('openFindIdDialog 요소를 찾을 수 없습니다.');
    }

    if (closeFindDialog) {
        closeFindDialog.addEventListener('click', () => {
            findIdDialog.close();
        });
    } else {
        console.error('closeFindDialog 요소를 찾을 수 없습니다.');
    }

    //
    // 비밀번호 찾기
    //

    //비밀번호 찾기 다이얼로그 변수
    const findPwdDialog = document.getElementById('findPwdDialog');
    const openFindPwdDialog = document.getElementById('findPwd');
    const closeFindPwdDialog = document.getElementById('closeFindPwdDialog');

    // 비밀번호 찾기 모달 열기/닫기 이벤트

    if (openFindPwdDialog) {
        openFindPwdDialog.addEventListener('click', (event) => {
            event.preventDefault();
            findPwdDialog.showModal();
        });
    } else {
        console.error('findPwdDialog 요소를 찾을 수 없습니다.');
    }

    if (closeFindPwdDialog) {
        closeFindPwdDialog.addEventListener('click', () => {
            findPwdDialog.close();
        });
    } else {
        console.error('closeFindPwdDialog 요소를 찾을 수 없습니다.');
    }
});