let bannerImages = [];  // 이미지 URL 저장
let currentIndex = 0;   // 현재 배너 인덱스
let interval;

function loadBannerImages() {
    $.ajax({
        url: '/rs/content/banner',
        type: 'get',
        success: function(res) {
            if (res.length > 0) {
                bannerImages = res.map(item => ({
                    src: "/rs/file-system/download/" + item.imageId,
                    moveTo: item.movePath,
                    title: item.title
                }));
                
                let wrapper = $(".bannerWrapper");
                wrapper.empty();    // 기존 배너 삭제

                // 배너 이미지를 동적으로 생성
                bannerImages.forEach((img, index) => {
                    let imgElement = `<img src="${img.src}" class="bannerImage" 
                        data-move-path="${img.moveTo}" 
                        title="${img.title}">`;
                    wrapper.append(imgElement);
                });

                // 배너 컨테이너 크기 설정 (배너 개수에 맞게)
                wrapper.css('width', `${bannerImages.length * 100}%`);

                startAutoSlide();

                // 배너 클릭 시 이동
                $(".bannerWrapper").on("click", ".bannerImage", function() {
                    let movePath = $(this).data("move-path");
                    window.open(movePath, "_blank");
                });
                
                // 버튼 클릭 이벤트 추가
                $(".prevButton").click(prevBanner);
                $(".nextButton").click(nextBanner);
            }
        },
        error: function() {
            console.log('배너 이미지 로딩 실패');
        }
    });
}

function startAutoSlide() {
    interval = setInterval(nextBanner, 5000);
}

function stopAutoSlide() {
    clearInterval(interval);
}

// 다음 배너 이동
function nextBanner() {
    stopAutoSlide(); // 자동 롤링 일시 정지
    currentIndex = (currentIndex + 1) % bannerImages.length;
    updateBannerPosition();
    startAutoSlide(); // 다시 자동 롤링 시작
}

// 이전 배너 이동
function prevBanner() {
    stopAutoSlide(); // 자동 롤링 일시 정지
    currentIndex = (currentIndex - 1 + bannerImages.length) % bannerImages.length;
    updateBannerPosition();
    startAutoSlide(); // 다시 자동 롤링 시작
}

function changeBanner() {
    currentIndex = (currentIndex + 1) % bannerImages.length;
    $(".bannerWrapper").css("transform", `translateX(-${currentIndex * 100}%)`);
}

// 배너 위치 업데이트 함수
function updateBannerPosition() {
    $(".bannerWrapper").css("transform", `translateX(-${currentIndex * 100}%)`);
}

$(document).ready(function() {
    loadBannerImages();
});