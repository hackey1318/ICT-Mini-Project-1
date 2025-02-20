<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .calendar-container {
            width: 100%;
            max-width: 500px;
            margin: auto;
            text-align: center;
            padding-top: 250px;
            padding-bottom: 100px;
        }

        .calendar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .calendar {
            width: 100%;
            border-collapse: collapse;
        }

        .calendar th, .calendar td {
            width: 14%;
            height: 50px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }

        .calendar td {
            cursor: pointer;
        }

        .calendar td:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <div class="calendar-container">
    <h1>신청내역</h1>
        <div class="calendar-header">
            <button id="prevMonth">◀</button>
            <h2 id="currentMonth"></h2>
            <button id="nextMonth">▶</button>
        </div>
        <table class="calendar">
            <thead>
                <tr>
                    <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
                </tr>
            </thead>
            <tbody id="calendarBody">
                <!-- JavaScript로 동적으로 날짜 추가 -->
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            let currentDate = new Date();
            let currentMonth = currentDate.getMonth();
            let currentYear = currentDate.getFullYear();

            function generateCalendar(year, month) {
            	
                let firstDay = new Date(year, month, 1).getDay();
                let lastDate = new Date(year, month + 1, 0).getDate();
 
                let formattedText = `${year}년 ${month + 1}월`;
                console.log("formattedText 값 확인:", formattedText);
                
                try{
                $("#currentMonth").text(formattedText);
                console.log(`화면에 표시된 연/월: ${formattedText}`);
                } catch(error) {
                console.log("currentMonth 업데이트 중 오류 발생:", error);
                }
                $("#calendarBody").empty();

                let date = 1;
                for (let i = 0; i < 6; i++) {
                    let row = $("<tr></tr>");
                    for (let j = 0; j < 7; j++) {
                        if (i === 0 && j < firstDay) {
                            row.append("<td></td>");
                        } else if (date > lastDate) {
                            break;
                        } else {
                            let cell = $("<td></td>").text(date);
                            cell.attr("data-date", `${year}-${month + 1}-${date}`);
                            row.append(cell);
                            date++;
                        }
                    }
                    $("#calendarBody").append(row);
                }
            }

            generateCalendar(currentYear, currentMonth);

            $("#prevMonth").click(function() {
                currentMonth--;
                if (currentMonth < 0) {
                    currentMonth = 11;
                    currentYear--;
                }
                generateCalendar(currentYear, currentMonth);
            });

            $("#nextMonth").click(function() {
                currentMonth++;
                if (currentMonth > 11) {
                    currentMonth = 0;
                    currentYear++;
                }
                generateCalendar(currentYear, currentMonth);
            });
        });
    </script>