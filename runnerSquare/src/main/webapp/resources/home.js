$(document).ready(function() {
    // 크루 리스트를 받아와서 동적으로 표시
    $.ajax({
        url: '/rs/crew/topThree', // 크루 리스트 API 경로
        type: 'GET',
        success: function(response) {
            let crewListHtml = ''; // 동적으로 HTML을 쌓을 변수

            response.forEach(function(vo) {
                // 첫 번째 이미지 또는 기본 이미지 설정
                const firstImage = vo.imageIdList && vo.imageIdList.length > 0 ? vo.imageIdList[0] : 'img/logo.png';
                const imageUrl = firstImage === 'img/logo.png' ? firstImage : '/rs/file-system/download/' + firstImage;

                // HTML 구성
                crewListHtml += `
                    <div class="crewInfoBox">
                        <img class="crewImg" src="${imageUrl}" />
                        <div class="crewInfo">
                            <h2>${vo.name}</h2>
                            <div>${vo.description}</div>
                            <button type="button" id="openCrewDetailBtn" data-bs-toggle="modal"
                                data-bs-target="#crewDetailModal" data-id="${vo.no}">상세보기</button>
                        </div>
                    </div>
                `;
            });

            // 동적으로 HTML에 추가
            $('#crewListContainer').html(crewListHtml);
        },
        error: function(err) {
            console.error("Error fetching crew list:", err);
            alert('크루 리스트를 불러오는 데 실패했습니다.');
        }
    });
});