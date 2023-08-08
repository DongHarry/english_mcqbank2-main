<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Duc
  Date: 23/07/2023
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Questions</title>
</head>
<body>
<h1>Bài thi</h1>
<div id="timer">Thời gian còn lại: </div>
<div id="question-count">Số câu hỏi: ${questions.size()}</div>
<hr>
<%--<form:form action="${pageContext.request.contextPath}/questions/submit" method="post">--%>
<form:form action="${pageContext.request.contextPath}/user/exams/submit" method="post" onsubmit="return validateQuiz()">
    <c:forEach var="question" items="${questions}">
        <div class="question-container">
            <h3>${question.content}</h3>
            <c:if test="${question.type == 2}">
                Audio: <audio controls>
                <source src="${pageContext.request.contextPath}/resource/audio/${question.option4}.mp3" type="audio/mpeg">
            </audio>
                <br>
            </c:if>
            <div>
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option1" value="${question.option1}" class="radio-option">
                <label for="question_${question.id}_option1" class="label-option">${question.option1}</label><br>
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option2" value="${question.option2}" class="radio-option">
                <label for="question_${question.id}_option2" class="label-option">${question.option2}</label><br>
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option3" value="${question.option3}" class="radio-option">
                <label for="question_${question.id}_option3" class="label-option">${question.option3}</label><br>
                <c:if test="${question.type == 1}">
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option4" value="${question.option4}" class="radio-option">
                <label for="question_${question.id}_option4" class="label-option">${question.option4}</label><br>
                </c:if>
            </div>
            <br><br>
        </div>
    </c:forEach>
    <input type="hidden" name="examId" value="${examId}">
    <input type="submit" value="Submit">
</form:form>

<!-- Add this script tag to include the JavaScript code -->
<script>
    function shuffleOptions(container) {
        var divElement = container.querySelector(".question-options");
        var elements = Array.from(divElement.getElementsByClassName("radio-option"));

        elements.sort(function(a, b) {
            return Math.random() - 0.5;
        });

        while (divElement.firstChild) {
            divElement.removeChild(divElement.firstChild);
        }

        for (var i = 0; i < elements.length; i++) {
            divElement.appendChild(elements[i]);
            divElement.appendChild(document.createElement("br"));
        }
    }

    // Call the shuffleOptions() function for each question container when the page is loaded
    window.onload = function() {
        var questionContainers = document.getElementsByClassName("question-container");
        for (var i = 0; i < questionContainers.length; i++) {
            shuffleOptions(questionContainers[i]);
        }
    };
</script>

<%--<form:form action="${pageContext.request.contextPath}/questions/submit" method="post">--%>
<%--    <c:forEach var="question" items="${questions}">--%>
<%--        <div class="question-container">--%>
<%--            <h3>${question.content}</h3>--%>
<%--            <div>--%>
<%--                <input type="radio" name="question_${question.id}" id="question_${question.id}_option1" value="${question.option1}">--%>
<%--                <label for="question_${question.id}_option1">${question.option1}</label><br>--%>
<%--                <input type="radio" name="question_${question.id}" id="question_${question.id}_option2" value="${question.option2}">--%>
<%--                <label for="question_${question.id}_option2">${question.option2}</label><br>--%>
<%--                <input type="radio" name="question_${question.id}" id="question_${question.id}_option3" value="${question.option3}">--%>
<%--                <label for="question_${question.id}_option3">${question.option3}</label><br>--%>
<%--                <input type="radio" name="question_${question.id}" id="question_${question.id}_option4" value="${question.option4}">--%>
<%--                <label for="question_${question.id}_option4">${question.option4}</label><br>--%>


<%--            </div>--%>
<%--            <br><br>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--    <input type="submit" value="Submit">--%>
<%--</form:form>--%>



  <script>
      $(document).ready(function() {
          // Số câu hỏi trong bài thi (lấy từ biểu thức EL)
          var questionCount = <c:out value="${questions.size()}" />;
          var timePerQuestion = 60; // Thời gian cho mỗi câu hỏi (tính theo giây)
          var totalTime = questionCount * timePerQuestion; // Tổng thời gian cho bài thi (tính theo giây)
          var maxTime = Math.floor(totalTime / 60); // Thời gian tối đa (tính theo phút)

          // Biến để lưu thời gian kết thúc đếm ngược
          var countDownDate;

          // Hàm để cập nhật thời gian còn lại và kiểm tra nếu đã hết thời gian
          function updateTimer() {
              var now = new Date().getTime();
              var distance = countDownDate - now;
              var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
              var seconds = Math.floor((distance % (1000 * 60)) / 1000);
              $("#time").text("Time remaining: " + minutes + ":" + seconds);
              if (distance < 0) {
                  clearInterval(timerInterval);
                  $('#submit-btn').click(); // Nếu hết thời gian, tự động nhấn nút Nộp bài
              }
          }

          // Hàm được gọi khi bắt đầu bài thi
          function startExam() {
              countDownDate = new Date().getTime() + maxTime * 60 * 1000; // Thời gian kết thúc đếm ngược là ${maxTime} phút sau thời điểm hiện tại
              timerInterval = setInterval(updateTimer, 1000); // Bắt đầu đếm ngược thời gian với mỗi giây cập nhật một lần
              $("#start-btn").prop("disabled", true); // Ẩn nút "Bắt đầu bài thi" sau khi bấm
          }

          // Xử lý sự kiện khi nút "Bắt đầu bài thi" được nhấn
          $("#start-btn").click(function() {
              startExam();
          });

          // Tự động bắt đầu đếm ngược khi trang tải xong
          startExam();
      });

  </script>
</body>
</html>
