function updateNotificationBadge(unreadCount) {
    const badge = document.getElementById('notificationBadge');

    if (unreadCount > 0) {
        badge.style.display = "block";  // 빨간 점 표시
    } else {
        badge.style.display = "none";   // 안 보이게 처리
    }
}

document.addEventListener("DOMContentLoaded", function () {

    const bellIcon = document.getElementById("notificationBell");
    const notificationDialog = document.getElementById("notificationDialog");
    const markAllAsReadButton = document.getElementById("markAllAsRead");
    const notificationList = document.getElementById("notificationList");

    // 🔔 클릭 시 알림 창 위치 업데이트 & 토글
    bellIcon.addEventListener("click", function (event) {
        event.stopPropagation();
        if (notificationDialog.style.display === "block") {
            notificationDialog.style.display = "none";
        } else {
            updateDialogPosition(); // 종 옆에 위치 조정
            notificationDialog.style.display = "block";
            loadNotifications();
        }
    });

    // 📌 화면 다른 곳 클릭하면 알림 창 닫기
    document.addEventListener("click", function (event) {
        if (!notificationDialog.contains(event.target) && event.target !== bellIcon) {
            notificationDialog.style.display = "none";
        }
    });

    // 📌 창 크기 변경 시 알림 창 위치 업데이트
    window.addEventListener("resize", function () {
        if (notificationDialog.style.display === "block") {
            updateDialogPosition();
        }
    });

    // 📌 종 모양 바로 옆에 알림 창 위치 조정
    function updateDialogPosition() {
        if (!bellIcon || !notificationDialog) {
            console.error("Bell Icon or Notification Dialog not found.");
            return;
        }

        const bellRect = bellIcon.getBoundingClientRect(); // 🔔 위치 정보 가져오기

        // bellRect 값 확인
        console.log('bellRect:', bellRect); // 디버깅용, 실제 값 확인

        // 알림 창에 position을 absolute로 설정
        notificationDialog.style.position = "absolute";
        notificationDialog.style.top = `${bellRect.bottom + window.scrollY}px`; // 계산된 top 값
        notificationDialog.style.left = `${bellRect.right + window.scrollX + 10}px`; // 계산된 left 값
    }

    markAllAsReadButton.addEventListener("click", function () {
        // 알림 목록에서 모든 알림 ID 수집
        const notificationNoList = Array.from(notificationList.children).map(item => item.dataset.id);

        // 서버로 전체 읽음 처리 요청
        markNotificationsAsRead(notificationNoList);
    });

    // 📌 알림 목록 불러오기 (예제)
    function loadNotifications() {
        const notificationList = document.getElementById("notificationList");
        notificationList.innerHTML = "";

        fetch('/rs/noti')
            .then(response => response.json())
            .then(data => {
                data.forEach((notification, index) => {
                    const li = document.createElement("li");

                    // 알림 번호 + 텍스트 그룹
                    const contentWrapper = document.createElement("div");
                    contentWrapper.classList.add("notification-content");

                     // 번호
                    const numberSpan = document.createElement("span");
                    numberSpan.classList.add("notification-number");
                    numberSpan.textContent = `${index + 1}. `;

                     // 알림 텍스트
                    const notificationText = document.createElement("span");
                    notificationText.classList.add("notification-text");
                    notificationText.textContent = notification.content;

                    contentWrapper.appendChild(numberSpan);
                    contentWrapper.appendChild(notificationText);
                    li.appendChild(contentWrapper);
                    li.dataset.id = notification.no;

                     // X 버튼 만들기
                    const closeButton = document.createElement("button");
                    closeButton.className = "btn close-btn";
                    closeButton.textContent = "X";

                    closeButton.addEventListener("click", function () {
                        li.remove();
                        markNotificationsAsRead([notification.no]);
                    });
                    li.appendChild(closeButton);
                    notificationList.appendChild(li);
                });
            })
            .catch(err => {
                console.error("notification err : ", err);
            });
    }

    function markNotificationsAsRead(notificationNoList) {
        fetch('/rs/noti', {
            method: 'PATCH', // POST 요청을 통해 알림을 읽음으로 처리
                headers: {
                    'Content-Type': 'application/json'
                },
            body: JSON.stringify(notificationNoList)
        })
        .then(response => {
            if (response.ok) {
                console.log('알림 ${notificationId}이(가) 읽음 처리되었습니다.');
                notificationDialog.style.display = "none";
                fetchNotificationCount();
            } else {
                console.error("알림 처리 중 오류 발생");
            }
        })
        .catch(error => {
            console.error("알림 읽음 처리 중 오류 발생:", error);
        });
    }
});