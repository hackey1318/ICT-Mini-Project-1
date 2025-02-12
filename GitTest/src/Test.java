// 각자 function을 만들어서 작성해주세요.

// 김학중 -> 오름차순으로 정렬, 10~17 숫자를 추가한 새로운 list와 새로운 list의 짝수의 합을 console에 print
// 강재현 -> 오름차순으로 정렬, 1~10까지 숫자 중 list에 존재하지 않는 숫자를 새로운 list(numList)로 만들고 numList와 numList의 합을 console에 print
// 양현의 -> 내림차순으로 정렬, 기존 list 숫자와 11~20까지의 숫자를 새로운 list에 추가하고 새로운 list와 list의 총 합을 console에 print
// 정인우 -> 내림차순으로 정렬, list와 홀수의 합을 console에 print

import java.util.ArrayList;
import java.util.List;

static List<Integer> numberList = new ArrayList<>();

public static void init() {
    numberList.add(1);
    numberList.add(6);
    numberList.add(5);
    numberList.add(3);
    numberList.add(8);
}
public static void main(String[] args) {
    init();
}