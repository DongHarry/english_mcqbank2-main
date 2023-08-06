<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
  <title>Giới hạn thời gian cho bài thi</title>
</head>
<body>
  <h1>Bài thi</h1>
  <div id="timer">Thời gian còn lại: <c:out value="${totalTime}" /> giây</div>
  <button onclick="startExam()">Bắt đầu bài thi</button>

  <script>
    var totalTime = <c:out value="${totalTime}" />; // Tổng thời gian cho bài thi (tính theo giây)
    var timerInterval; // Biến để lưu đối tượng setInterval

    // Hàm để cập nhật thời gian còn lại và kiểm tra nếu đã hết thời gian
    function updateTimer() {
      if (totalTime > 0) {
        var minutes = Math.floor(totalTime / 60);
        var seconds = totalTime % 60;
        document.getElementById("timer").innerText = "Thời gian còn lại: " + minutes + " phút " + seconds + " giây";
        totalTime--;
      } else {
        clearInterval(timerInterval);
        document.getElementById("timer").innerText = "Hết thời gian!";
        // Thực hiện hành động khi hết thời gian, ví dụ: nộp bài tự động
        // Your code here
      }
    }

    // Hàm được gọi khi bắt đầu bài thi
    function startExam() {
      // Gọi servlet hoặc JSP để bắt đầu tính toán thời gian phía máy chủ (nếu cần)
      // Ví dụ: dùng AJAX để gọi servlet để bắt đầu bài thi và nhận lại tổng thời gian cho bài thi
      // ...

      // Bắt đầu đếm ngược thời gian với mỗi giây cập nhật một lần
      timerInterval = setInterval(updateTimer, 1000);
      // Ở đây, bạn nên thực hiện các hành động khởi đầu bài thi, ví dụ: ẩn nút "Bắt đầu bài thi"
      // Your code here
    }
  </script>
</body>
</html>
