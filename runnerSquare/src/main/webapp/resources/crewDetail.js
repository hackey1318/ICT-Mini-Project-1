$(document).ready(function() {
	// Modal 버튼 클릭 시 이벤트
	$('.main-container').on('click', '#openCrewDetailBtn, .crewList', function() {
		// crew 정보에서 no를 가져와서 data-id에 저장
		var crewNo = $(this).data("id"); // vo.no 값을 가져옴
		
		// Modal을 열 때마다 Ajax로 crew 상세 정보 요청
		$.ajax({
			url: '/rs/crew/details/' + crewNo, // 요청 URL
			type: 'GET',
			success: function(response) {
				// 서버에서 응답 받은 데이터로 모달의 내용을 업데이트
				$('#crewDetailModal .modal-title').text(response.name); // 모달 제목 업데이트
				$('#crewDetailModal #modalName').text(response.name); // 크루 이름 업데이트
				$('#crewDetailModal #modalDescription').text(response.description); // 설명 업데이트
				$('#crewDetailModal #modalLocation').text(response.city + ', ' + response.district); // 위치 업데이트
				$('#crewDetailModal #modalRunningDay').text(response.runningDay); // 러닝데이 업데이트
                $('#crewDetailModal #modalImageContainer').empty();
                response.imageIdList.forEach(imageId => {
                    const imgElement = $('<img>', {
                        src: '/rs/file-system/download/' + imageId,
                        class: 'crew-image'
                    });
                    $('#crewDetailModal #modalImageContainer').append(imgElement);
                });
                // 이미지 슬라이드 기능
                let index = 0;
                const images = $('#modalImageContainer .crew-image');
                const totalImages = images.length;

                // 슬라이드를 위한 함수
                function slideImages() {
                    images.each(function(i) {
                        $(this).css('transform', `translateX(-${index * 100}%)`);
                    });
                    index = (index + 1) % totalImages; // 이미지 순환
                }

                // 5초마다 슬라이드
                var slideInterval = setInterval(slideImages, 5000);
                // 모달이 닫힐 때 슬라이드 인터벌 해제
                $('#crewDetailModal').on('hidden.bs.modal', function () {
                    clearInterval(slideInterval);
                });
			},
			error: function(err) {
				console.error("error : ", err);
				alert('크루 정보를 불러오는 데 실패했습니다.');
			}
		});
	});
	// ✅ 모달 닫힐 때 정보 초기화
    $('#crewDetailModal').on('hidden.bs.modal', function () {
        $(this).find('.modal-title, #modalName, #modalDescription, #modalLocation, #modalRunningDay').text(''); // 텍스트 초기화
        $('#modalImageContainer').empty(); // 이미지 삭제
    });
});

function crewJoin() {
	var userId = sessionStorage.getItem("id");
	
	if (!userId) {
		// openLoginDialog
		return;
	}

	$.ajax({
        type: "POST",
        url: "/crew/crewJoin",
        data: {
            crew_no: crewNo,
			id: userId            
        },
        success: function(response) {
			if (response == "1") {
				alert("크루 참여 신청이 완료되었습니다!");
			}
            // modal 닫기
        },
        error: function(error) {
            console.error("Error:", error);
            alert("오류가 발생했습니다.");
        }
    });
}