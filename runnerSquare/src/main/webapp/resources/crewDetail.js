$(document).ready(function() {
	// Modal 버튼 클릭 시 이벤트
	$('.main-container').on('click', '#openCrewDetailBtn, .crewList', function() {
		// crew 정보에서 no를 가져와서 data-id에 저장
		var crewNo = $(this).data("id"); // vo.no 값을 가져옴
		console.log(crewNo);
		document.getElementById('crewDetailModal').setAttribute('data-id', crewNo);

		// Modal을 열 때마다 Ajax로 crew 상세 정보 요청
		$.ajax({
			url: '/rs/crew/details/' + crewNo, // 요청 URL
			type: 'GET',
			success: function(response) {
				// 서버에서 응답 받은 데이터로 모달의 내용을 업데이트
				$('#crewDetailModal .modal-title').text(response.name); // 모달 제목 업데이트
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
                setInterval(slideImages, 5000);
			},
			error: function(err) {
				console.error("error : ", err);
				alert('크루 정보를 불러오는 데 실패했습니다.');
			}
		});
	});
});

