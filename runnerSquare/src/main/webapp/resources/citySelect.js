let cityData = {
	"서울특별시": [
		"종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"
	],
	"부산광역시": [
		"중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "강서구", "해운대구", "사하구", "금정구", "연제구", "수영구", "사상구", "기장군"
	],
	"인천광역시": [
		"중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"
	],
	"대구광역시": [
		"중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군", "군위군"
	],
	"광주광역시": [
		"동구", "서구", "남구", "북구", "광산구"
	],
	"대전광역시": [
		"동구", "중구", "서구", "유성구", "대덕구"
	],
	"울산광역시": [
		"중구", "남구", "동구", "북구", "울주군"
	],
	"세종특별자치시": ["-"],
	"경기도": [
		"가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"
	],
	"강원특별자치도": [
		"원주시", "춘천시", "강릉시", "동해시", "속초시", "삼척시", "홍천군", "태백시", "철원군", "횡성군", "평창군", "영월군", "정선군", "인제군", "고성군", "양양군", "화천군", "양구군"
	],
	"충청북도": [
		"청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군"
	],
	"충청남도": [
		"천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"
	],
	"경상북도": [
		"포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군"
	],
	"경상남도": [
		"창원시", "김해시", "진주시", "양산시", "거제시", "통영시", "사천시", "밀양시", "함안군", "거창군", "창녕군", "고성군", "하동군", "합천군", "남해군", "함양군", "산청군", "의령군"
	],
	"전북특별자치도": [
		"전주시", "익산시", "군산시", "정읍시", "완주군", "김제시", "남원시", "고창군", "부안군", "임실군", "순창군", "진안군", "장수군", "무주군"
	],
	"전라남도": [
		"여수시", "순천시", "목포시", "광양시", "나주시", "무안군", "해남군", "고흥군", "화순군", "영암군", "영광군", "완도군", "담양군", "장성군", "보성군", "신안군", "장흥군", "강진군", "함평군", "진도군", "곡성군", "구례군"
	],
	"제주특별자치도": [
		"제주시", "서귀포시"
	]
};

let cityArr = Object.keys(cityData);

addEventListener("DOMContentLoaded", (event) => {
	makeSel();
	restoreSelectedValues();
});

function makeSel() {
    let citySel = document.getElementById('citySelect');

    // URL에서 전달된 값 가져오기
    const urlParams = new URLSearchParams(window.location.search);
    const cityFromUrl = urlParams.get('city');

    // citySelect 옵션을 동적으로 생성
    for (let i = 0; i < cityArr.length; i++) {
        let option = document.createElement('option');
        option.value = cityArr[i];
        option.textContent = cityArr[i];

        // URL에서 가져온 값이 있으면 해당 city를 선택
        if (cityFromUrl && cityFromUrl === cityArr[i]) {
            option.selected = true;
        }
        // URL 값이 없고 localStorage에 저장된 값이 있으면 이를 선택
        else if (!cityFromUrl && localStorage.getItem('selectedCity') === cityArr[i]) {
            option.selected = true;
        }

        citySel.appendChild(option);
    }

    // URL 값이 있으면 changeState() 호출
    if (cityFromUrl) {
        changeState();
    }
}

function changeState() {
    let citySel = document.getElementById('citySelect');
    let selectedCity = citySel.options[citySel.selectedIndex].value;
    let districtSel = document.getElementById("districtSelect");

    // district 옵션을 초기화
    districtSel.innerHTML = "<option value=''>시/군/구</option>";

    // 선택된 city에 맞는 district 옵션 갱신
    if (selectedCity && cityData[selectedCity]) {
        for (let i = 0; i < cityData[selectedCity].length; i++) {
            let option = document.createElement('option');
            option.value = cityData[selectedCity][i];
            option.textContent = cityData[selectedCity][i];
            districtSel.appendChild(option);
        }
    }

    // 선택된 district 값을 저장
    let selectedDistrict = districtSel.value;
    localStorage.setItem('selectedCity', selectedCity);
    localStorage.setItem('selectedDistrict', selectedDistrict);
}

function restoreSelectedValues() {
    let citySel = document.getElementById('citySelect');
    let districtSel = document.getElementById('districtSelect');
    let crewNameInput = document.getElementById('crewName');

    const urlParams = new URLSearchParams(window.location.search);
    const cityFromUrl = urlParams.get('city');
    const districtFromUrl = urlParams.get('district');
    const crewNameFromUrl = urlParams.get('crewName')

    // URL에서 city 값이 있으면 해당 값 선택
    if (cityFromUrl) {
        citySel.value = cityFromUrl;
        changeState(); // city에 맞는 district 값 갱신
    } else {
        // 기본적으로 "시/도"를 선택 상태로 유지
        citySel.value = "";
    }

    // URL에서 district 값이 있으면 해당 값 선택
    if (districtFromUrl) {
        districtSel.value = districtFromUrl;
    } else {
        // 기본적으로 "시/군/구"를 선택 상태로 유지
        districtSel.value = "";
    }
    
    // URL에서 crewName 값이 있으면 해당 값 설정
    if (crewNameFromUrl) {
        crewNameInput.value = crewNameFromUrl; // crewName input에 값 설정
    } else {
        // crewName 값이 없으면 기본적으로 빈 값
        crewNameInput.value = "";
    }
}