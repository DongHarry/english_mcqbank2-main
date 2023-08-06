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
<h1>Questions</h1>
<%--<form:form action="${pageContext.request.contextPath}/questions/submit" method="post">--%>
<form:form action="${pageContext.request.contextPath}/user/exams/submit" method="post" onsubmit="return validateQuiz()">
    <c:forEach var="question" items="${questions}">
        <div class="question-container">
            <h3>${question.content}</h3>
            <div>
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option1" value="${question.option1}" class="radio-option" required>
                <label for="question_${question.id}_option1" class="label-option">${question.option1}</label><br>
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option2" value="${question.option2}" class="radio-option" required>
                <label for="question_${question.id}_option2" class="label-option">${question.option2}</label><br>
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option3" value="${question.option3}" class="radio-option" required>
                <label for="question_${question.id}_option3" class="label-option">${question.option3}</label><br>
                <input type="radio" name="question_${question.id}" id="question_${question.id}_option4" value="${question.option4}" class="radio-option" required>
                <label for="question_${question.id}_option4" class="label-option">${question.option4}</label><br>
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

<h1>Bài thi</h1>
  <div id="timer">Thời gian còn lại: </div>
  <div id="question-count">Số câu hỏi: ${questions.size()}</div>
  <button id="start-btn">Bắt đầu bài thi</button>

  <script>
    $(document).ready(function() {
      // Số câu hỏi trong bài thi (lấy từ biểu thức EL)
      var questionCount = <c:out value="${questions.size()}" />;
      var timePerQuestion = 60; // Thời gian cho mỗi câu hỏi (tính theo giây)
      var totalTime = questionCount * timePerQuestion; // Tổng thời gian cho bài thi (tính theo giây)
      var timerInterval; // Biến để lưu đối tượng setInterval

      // Hàm để cập nhật thời gian còn lại và kiểm tra nếu đã hết thời gian
      function updateTimer() {
        if (totalTime > 0) {
          var minutes = Math.floor(totalTime / 60);
          var seconds = totalTime % 60;
          $("#timer").text("Thời gian còn lại: " + minutes + " phút " + seconds + " giây");
          totalTime--;
        } else {
          clearInterval(timerInterval);
          $("#timer").text("Hết thời gian!");
          submitExam();
        }
      }

      // Hàm để nộp bài tự động
      function submitExam() {
        alert("Đã hết thời gian, bài thi đã được nộp tự động!");
      }

      // Xử lý sự kiện khi nút "Bắt đầu bài thi" được nhấn
      $("#start-btn").click(function() {
        // Bắt đầu đếm ngược thời gian với mỗi giây cập nhật một lần
        timerInterval = setInterval(updateTimer, 1000);
        document.getElementById("start-btn").style.display = "none";
      });
    });
  </script>
</body>
</html>
