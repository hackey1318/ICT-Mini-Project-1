function getCrewNo() {
    return document.getElementById('crewDetailModal').getAttribute('data-id');
}

function crewJoin(role, crewNo) {
    // 세션의 'logStatus'를 확인하기 위해 요청
    fetch('/rs/users/checkLogStatus', {
        method: 'GET',  // 세션 값을 확인하는 GET 요청
    })
    .then(response => response.json())
    .then(data => {        
        const userNo = data.userNo;
        
        if (userNo) {  // 세션이 로그인 상태라면
            const requestData = {
                crewNo: crewNo,
                userNo: userNo,
                role: role
            };

            // 크루가입을 요청하는 POST 요청
            fetch('/rs/crew/crewJoin', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData),
            })
            .then(response => response.json())
            .then(data => {
                if (data == 1 && role == 'member') {
                    alert('크루 가입 성공!');
                } else {
                    alert('크루 가입 실패');
                }
            })
            .catch(error => {
                console.error('가입 중 오류가 발생했습니다.', error);
                alert('오류가 발생했습니다. 다시 시도해주세요.');
            });

        } else {
            alert('로그인 후 가입 가능합니다.');
        }
    })
    .catch(error => {
        console.error('세션 확인 중 오류 발생:', error);
        alert('세션 확인 중 오류가 발생했습니다. 다시 시도해주세요.');
    });
}