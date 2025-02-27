package src;// 각자 function을 만들어서 작성해주세요.

// 김학중 -> 오름차순으로 정렬, 10~17 숫자를 추가한 새로운 list와 새로운 list의 짝수의 합을 console에 print
// 강재현 -> 오름차순으로 정렬, 1~10까지 숫자 중 list에 존재하지 않는 숫자를 새로운 list(numList)로 만들고 numList와 numList의 합을 console에 print
// 양현의 -> 내림차순으로 정렬, 기존 list 숫자와 11~20까지의 숫자를 새로운 list에 추가하고 새로운 list와 list의 총 합을 console에 print
// 정인우 -> 내림차순으로 정렬, list와 홀수의 합을 console에 print

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Test {

    static List<Integer> numberList = new ArrayList<>();

    public static void sortAscNum1to10(){

        List<Integer> numList = new ArrayList<>(numberList);
        for(int i= 1; i<=10; i++){
            if(!numberList.contains(i)){
                numList.add(i);
                Collections.sort(numList);
            }
        }

        System.out.println("1~10 뉴리스트" + numList);
        int sum = 0;
        for(int num : numList){
            sum += num;
        }

        System.out.println("1~10 뉴리스트의 합 : " + sum);
    }

    public static void sortAscNum10to17() {
        Collections.sort(numberList); // 오름차순 정렬

        List<Integer> newList = new ArrayList<>(numberList); // 10~17 숫자를 추가한 새로운 리스트 생성
        for (int i = 10; i <= 17; i++) {
            newList.add(i);
        }

        System.out.println("뉴리스트: " + newList); // 새로운 리스트 출력

        int sumEven = 0; // 짝수의 합 계산 및 출력
        for (int num : newList) {
            if (num % 2 == 0) {
                sumEven += num;
            }
        }
        System.out.println("짝수의 합: " + sumEven);
    }

    public static void sortDescNum11to20() {
        // 내림차순으로 정렬, 기존 list 숫자와 11~20까지의 숫자를 새로운 list에 추가하고 새로운 list와 list의 총 합을 console에 print
        List<Integer> newList = new ArrayList<>(numberList);
        for (int i = 11; i <= 20; i++) {
            newList.add(i);
        }

        int sum = 0;
        for (Integer i : numberList) {
            sum += i;
        }
        int newSum = 0;
        for (Integer i : newList) {
            newSum += i;
        }
        newList.sort(Collections.reverseOrder());
        System.out.println(newList);
        System.out.println("기존 list의 총합 = " + sum);
        System.out.println("새로운 list의 총합 = " + newSum);
    }

    public static void sortDescListandOddsum(){
        //내림차순으로 정렬
        Collections.sort(numberList, Collections.reverseOrder());
        System.out.println("내림차순으로 정렬: " + numberList);

        //홀수의 합
        int Oddsum = 0;
        for(int num : numberList){
            if(num % 2 != 0){
                Oddsum += num;
            }
        }
        System.out.println("홀수의 합: " + Oddsum);
    }

    public static void init() {
        numberList.add(1);
        numberList.add(6);
        numberList.add(5);
        numberList.add(3);
        numberList.add(8);
    }

    public static void main(String[] args) {
        init();
        sortAscNum1to10();
        sortAscNum10to17();
        sortDescNum11to20();
        sortDescListandOddsum();
    }
}