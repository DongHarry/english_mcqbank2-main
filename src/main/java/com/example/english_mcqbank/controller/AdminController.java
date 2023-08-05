package com.example.english_mcqbank.controller;


import com.example.english_mcqbank.model.*;
import com.example.english_mcqbank.service.ExamService;
import com.example.english_mcqbank.service.LogService;
import com.example.english_mcqbank.service.TopicService;
import com.example.english_mcqbank.service.UserDetailsServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class AdminController {
    final UserDetailsServiceImpl userService;
    final LogService logService;
    final TopicService topicService;
    final PasswordEncoder passwordEncoder;
    final ExamService examService;

    @RequestMapping("/admin/profile")
    public ModelAndView adminProfile(Authentication authentication) {
        ModelAndView view = new ModelAndView("profile");
        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        view.addObject("user", user);
        return view; // Trả về admin.jsp
    }

    @RequestMapping("/admin/users/{id}")
    public ModelAndView viewUser(@PathVariable Integer id) {
        ModelAndView view = new ModelAndView("profile");
        UserEntity user = userService.getUserByUserid(id);
        view.addObject("user", user);
        return view; // Trả về admin.jsp
    }

    @RequestMapping("/admin/users/{id}/logs")
    public ModelAndView viewUserLogs(@PathVariable Integer id,
                                     @RequestParam(defaultValue = "0") int page,
                                     @RequestParam(defaultValue = "20") int size) {
        ModelAndView logsModelAndView = new ModelAndView("logs");
        UserEntity user = userService.getUserByUserid(id);
        List<Log> logs = logService.getLogsByUser(user, page, size);
        logsModelAndView.addObject("logs", logs);
        logsModelAndView.addObject("currentPage", page);
        assert logs != null;
        boolean hasNext = logs.size() >= size;
        logsModelAndView.addObject("hasNext", hasNext);
        return logsModelAndView; // Trả về admin.jsp
    }

    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public String users(Model model) {
        List<UserEntity> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "allUsers"; // Trả về admin.jsp
    }

    @RequestMapping(value = "/admin/users/new", method = RequestMethod.GET)
    public String addUser(Model model) {
        model.addAttribute("user", new UserEntity());
        return "addUser"; // Trả về admin.jsp
    }

    @RequestMapping(value = "/admin/addUser", method = RequestMethod.POST)
    public ModelAndView registerUser(RedirectAttributes redirectAttributes,
                                     @ModelAttribute("user") UserEntity user,
                                     @RequestParam("confirmPassword") String confirmPassword,
                                     @RequestParam("role") String role) {
        if (userService.isUserPresent(user.getUsername())
                || userService.isEmailPresent(user.getEmail())
                || userService.isPhonePresent(user.getPhone())) {
            redirectAttributes.addFlashAttribute("message", "User already exists");
            return new ModelAndView("redirect:/admin");
        }

        if (!user.getPassword().equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("message", "Password and confirm password do not match");
            return new ModelAndView("redirect:/admin");
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setCreatedDate(new Date());
        user.setStatus(1);
        if (role.equals("admin")) {
            user.setGroupId(0);
        } else {
            user.setGroupId(1);
        }

        try {
            userService.saveUser(user);
            redirectAttributes.addFlashAttribute("message", "User added successfully!");
            Log log = new Log();
            log.setUser(user);
            log.setDatetime(new Date());
            log.setName("User added successfully!");
            logService.saveLog(log);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error adding user");
        }

        return new ModelAndView("redirect:/admin");
    }


    @RequestMapping(value = "/admin/delete")
    public ModelAndView deleteUser(@RequestParam("username") String username, RedirectAttributes redirectAttributes) {
        try {
            UserEntity user = userService.findByUsername(username);
            if (user == null) {
                redirectAttributes.addFlashAttribute("message", "User does not exist");
                return new ModelAndView("redirect:/admin");
            }
            if (user.getGroupId() == 0) {
                redirectAttributes.addFlashAttribute("message", "Cannot delete admin");
                return new ModelAndView("redirect:/admin");
            }
            List<Log> logs = logService.getLogsByUser(user);
            if (logs != null) {
                logService.deleteAllLog(logs);
            }
            userService.deleteUser(user);
            redirectAttributes.addFlashAttribute("message", "User deleted successfully");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error deleting user");
        }

        return new ModelAndView("redirect:/admin");
    }

    @RequestMapping(value = "/admin/allLogs")
    public ModelAndView allLogs(@RequestParam(defaultValue = "0") int page,
                                @RequestParam(defaultValue = "20") int size) {
        ModelAndView modelAndView = new ModelAndView("allLogs");
        List<Log> logs = logService.findAllLogs(page, size);
        modelAndView.addObject("logs", logs);
        modelAndView.addObject("currentPage", page);
        assert logs != null;
        boolean hasNext = logs.size() >= size;
        modelAndView.addObject("hasNext", hasNext);

        return modelAndView;
    }

    @RequestMapping(value = "/admin/exams/new", method = RequestMethod.GET)
    public ModelAndView addExam() {
        List<Topic> topics = topicService.getAllTopics();
        ModelAndView modelAndView = new ModelAndView("addExam");
        modelAndView.addObject("topics", topics);
        return modelAndView;
    }

//    @RequestMapping(value = "/admin/addExam", method = RequestMethod.POST)
//    public ModelAndView addExam(@RequestParam("questionNo") String questionNo,
//                                @RequestParam("topicId") int topicId,
//                                RedirectAttributes redirectAttributes) {
//        try {
//            Exam exam = new Exam();
//            exam.setQuestionNo(Integer.parseInt(questionNo));
//            exam.setTopicId(topicId);
//            exam.setTime(new Date());
//            exam.setPercent(0);
//            examService.saveExam(exam);
//        } catch (Exception e) {
//            redirectAttributes.addFlashAttribute("message", "Error adding exam");
//            return new ModelAndView("redirect:/admin");
//        }
//        ModelAndView modelAndView1 = new ModelAndView("redirect:/admin/exams");
//        redirectAttributes.addFlashAttribute("message", "Exam added successfully");
//        return modelAndView1;
//    }

    @PostMapping("/admin/addExam")
    public ModelAndView addExam(@RequestParam("questionNo") String questionNo,
                          @RequestParam Map<String, String> requestParams) {

        // Tạo một Map để chứa topicId và numOfQu tương ứng
        Map<Long, Integer> topicNumOfQuMap = new HashMap<>();

        // Duyệt qua các tham số trong requestParams để tách giá trị numOfQu tương ứng với từng topicId
        for (Map.Entry<String, String> entry : requestParams.entrySet()) {
            String paramName = entry.getKey();
            String paramValue = entry.getValue();

            // Kiểm tra các paramName để xác định danh sách topic và numQu
            // Ví dụ: paramName có dạng "topic1", "numQu.OfTopic1", ...
            if (paramName.startsWith("topic")) {
                // Xử lý danh sách topic được chọn (paramValue chứa giá trị của topic.id)
                Long topicId = Long.parseLong(paramValue);
                // Tạo tên tham số numOfQu tương ứng
                String numOfQuParamName = "numQu.OfTopic" + topicId;
                // Lấy giá trị numOfQu từ requestParams dựa vào tên tham số numOfQu tương ứng
                String numOfQuValue = requestParams.get(numOfQuParamName);
                // Chuyển đổi giá trị numOfQu từ String sang Integer (hoặc bạn có thể sử dụng parseInt)
                Integer numOfQu = Integer.valueOf(numOfQuValue);

                // Đưa cặp topicId và numOfQu vào Map
                topicNumOfQuMap.put(topicId, numOfQu);
            }
        }

        // Sau khi có Map mới tương ứng <topicId, numOfQu>, bạn có thể thực hiện các thao tác cần thiết với dữ liệu này.
        Exam exam = new Exam();
        exam.setQuestionNo(Integer.parseInt(questionNo));
        exam.setTime(new Date());
        exam.setPercent(0);
        exam.setTopicId(1);
        for (Map.Entry<Long, Integer> entry : topicNumOfQuMap.entrySet()) {
            Long topicId = entry.getKey();
            Integer numOfQu = entry.getValue();
            ExamTopic examTopic = new ExamTopic();
            examTopic.setTopic(topicService.getTopicById(topicId.intValue()));
            examTopic.setPercent(0);
            exam.addExamTopic(examTopic);

            System.out.println("topicId: " + topicId + ", numOfQu: " + numOfQu);
        }

        examService.saveExam(exam);

        // Redirect hoặc trả về view (tùy vào logic của ứng dụng)
        return new ModelAndView("redirect:/admin/exams"); // Thay thế "path-to-some-page" bằng đường dẫn mong muốn
    }

    @RequestMapping(value = "/admin/exams", method = RequestMethod.GET)
    public ModelAndView exams() {
        ModelAndView modelAndView = new ModelAndView("exams");
        List<Exam> exams = examService.getAllExams();
        modelAndView.addObject("exams", exams);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/deleteExam", method = RequestMethod.GET)
    public ModelAndView deleteExam(@RequestParam("examId") int id, RedirectAttributes redirectAttributes) {
        try {
            Exam exam = examService.getExamById(id);
            if (exam == null) {
                redirectAttributes.addFlashAttribute("message", "Exam does not exist");
                return new ModelAndView("redirect:/admin/exams");
            }
            examService.deleteExam(exam);
            redirectAttributes.addFlashAttribute("message", "Exam deleted successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error deleting exam");
        }
        return new ModelAndView("redirect:/admin/exams");
    }

    @RequestMapping(value = "/admin/results/{examId}", method = RequestMethod.GET)
    public ModelAndView results(@RequestParam(defaultValue = "0") int page,
                                @RequestParam(defaultValue = "10") int size,
                                @PathVariable("examId") int examId) {
        ModelAndView modelAndView = new ModelAndView("userResult");
        List<Result> results = examService.getResultsByExamId(examId, page, size);
        modelAndView.addObject("results", results);
        modelAndView.addObject("title", "All Users results for exam " + examId);
        modelAndView.addObject("currentPage", page);
        assert results != null;
        boolean hasNext = results.size() >= size;
        modelAndView.addObject("hasNext", hasNext);
        //modelAndView.addObject("examId", examId);
        return modelAndView;
    }
}
