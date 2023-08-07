package com.example.english_mcqbank.controller;


import com.example.english_mcqbank.model.*;
import com.example.english_mcqbank.service.*;
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
    final QuestionService questionService;
    final PasswordEncoder passwordEncoder;
    final ExamService examService;

    @RequestMapping("/admin/profile")
    public ModelAndView adminProfile(Authentication authentication) {
        ModelAndView view = new ModelAndView("profile");
        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        view.addObject("user", user);
        view.addObject("loggedInUser", user);
        view.addObject("successMessage", null);
        view.addObject("errorMessage", null);
        view.addObject("type", 1);
        return view; // Trả về admin.jsp
    }

    @RequestMapping("/admin/users/{id}")
    public ModelAndView viewUser(@PathVariable Integer id, Authentication authentication) {
        ModelAndView view = new ModelAndView("profile");
        UserEntity user = userService.getUserByUserid(id);
        view.addObject("user", user);
        view.addObject("loggedInUser", userService.getUserByUsername(authentication.getName()));
        view.addObject("type", 2);
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
    public String users(Model model,
                        @RequestParam(defaultValue = "0") int page,
                        @RequestParam(defaultValue = "10") int size) {
        List<UserEntity> users = userService.getAllUsers(page, size);
        model.addAttribute("users", users);
        model.addAttribute("type", 2);
        model.addAttribute("currentPage", page);
        assert users != null;
        boolean hasNext = users.size() >= size;
        model.addAttribute("hasNext", hasNext);
        return "allUsers"; // Trả về admin.jsp
    }

    @RequestMapping(value = "/admin/users/new", method = RequestMethod.GET)
    public ModelAndView addUser(Model model) {
        model.addAttribute("user", new UserEntity());
        ModelAndView modelAndView = new ModelAndView("addUser");
        modelAndView.addObject("type", 3);
        return modelAndView;
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
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/users/new");
            //modelAndView.addObject("message", "User already exists");
            return modelAndView;
        }

        if (!user.getPassword().equals(confirmPassword)) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/users/new");
            redirectAttributes.addFlashAttribute("message", "Password does not match");
            //modelAndView.addObject("message", "Password does not match");
            return modelAndView;
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

        return new ModelAndView("redirect:/admin/users");
    }


    @RequestMapping(value = "/admin/delete")
    public ModelAndView deleteUser(@RequestParam("username") String username, RedirectAttributes redirectAttributes) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/users");
        try {
            UserEntity user = userService.findByUsername(username);
            if (user == null) {
//                redirectAttributes.addFlashAttribute("message", "User does not exist");
//                return new ModelAndView("allUsers");
                modelAndView.addObject("message", "User does not exist");
                return modelAndView;
            }
            if (user.getGroupId() == 0) {
//                redirectAttributes.addFlashAttribute("message", "Cannot delete admin");
//                return new ModelAndView("allUsers");
                modelAndView.addObject("message", "Cannot delete admin");
                return modelAndView;
            }
            List<Log> logs = logService.getLogsByUser(user);
            if (logs != null) {
                logService.deleteAllLog(logs);
            }
            userService.deleteUser(user);
            modelAndView.addObject("message", "User deleted successfully");
            //redirectAttributes.addFlashAttribute("message", "User deleted successfully");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error deleting user");
        }

        return modelAndView;
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

    @RequestMapping(value = "/admin/questions", method = RequestMethod.GET)
    public ModelAndView questionList(@RequestParam(defaultValue = "0") int page,
                                     @RequestParam(defaultValue = "20") int size) {
        List<Question> questions = questionService.getAllQuestions(page, size);
        ModelAndView modelAndView = new ModelAndView("questionList2");
        modelAndView.addObject("questions", questions);
        modelAndView.addObject("currentPage", page);
        assert questions != null;
        boolean hasNext = questions.size() >= size;
        modelAndView.addObject("hasNext", hasNext);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/new", method = RequestMethod.GET)
    public ModelAndView addQuestion() {
        List<Topic> topics = topicService.getAllTopics();
        ModelAndView modelAndView = new ModelAndView("addQuestion");
        modelAndView.addObject("topics", topics);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/addQuestion", method = RequestMethod.POST)
    public ModelAndView addQuestion(@RequestParam("question") String question,
                                    @RequestParam("answer1") String answer1,
                                    @RequestParam("answer2") String answer2,
                                    @RequestParam("answer3") String answer3,
                                    @RequestParam("answer4") String answer4,
                                    @RequestParam("correctAnswer") String correctAnswer,
                                    @RequestParam("topicId") int topicId,
                                    RedirectAttributes redirectAttributes) {
        return new ModelAndView("redirect:/admin");
    }

    @RequestMapping(value = "/admin/topics", method = RequestMethod.GET)
    public ModelAndView topicList(@RequestParam(defaultValue = "0") int page,
                                  @RequestParam(defaultValue = "20") int size) {
        List<Topic> topics = topicService.getAllTopics(page, size);
        ModelAndView modelAndView = new ModelAndView("topics");
        modelAndView.addObject("topics", topics);
        modelAndView.addObject("currentPage", page);
        assert topics != null;
        boolean hasNext = topics.size() >= size;
        modelAndView.addObject("hasNext", hasNext);
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
                          @RequestParam("examName") String examName,
                          @RequestParam Map<String, String> requestParams) {

        // Tạo một Map để chứa topicId và numOfQu tương ứng
        Map<Long, Integer> topicNumOfQuMap = examService.getTopicNumOfQuMap(requestParams);
        // Duyệt qua các tham số trong requestParams để tách giá trị numOfQu tương ứng với từng topicId



        // Sau khi có Map mới tương ứng <topicId, numOfQu>, bạn có thể thực hiện các thao tác cần thiết với dữ liệu này.
        Exam exam = new Exam();
        exam.setQuestionNo(Integer.parseInt(questionNo));
        exam.setTime(new Date());
        exam.setName(examName);
        //exam.setTopicId(1);
        for (Map.Entry<Long, Integer> entry : topicNumOfQuMap.entrySet()) {
            Long topicId = entry.getKey();
            Integer numOfQu = entry.getValue();
            ExamTopic examTopic = new ExamTopic();
            examTopic.setTopic(topicService.getTopicById(topicId.intValue()));
            examTopic.setPercent(numOfQu);
            exam.addExamTopic(examTopic);

            //System.out.println("topicId: " + topicId + ", numOfQu: " + numOfQu);
        }

        examService.saveExam(exam);

        // Redirect hoặc trả về view (tùy vào logic của ứng dụng)
        return new ModelAndView("redirect:/admin/exams"); // Thay thế "path-to-some-page" bằng đường dẫn mong muốn
    }

    @RequestMapping(value = "/admin/exams", method = RequestMethod.GET)
    public ModelAndView exams(@RequestParam(defaultValue = "0") int page,
                              @RequestParam(defaultValue = "5") int size) {
        ModelAndView modelAndView = new ModelAndView("exams");
        List<Exam> exams = examService.getAllExams(page, size);
        modelAndView.addObject("exams", exams);
        modelAndView.addObject("currentPage", page);
        assert exams != null;
        boolean hasNext = exams.size() >= size;
        modelAndView.addObject("hasNext", hasNext);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/Exam", method = RequestMethod.GET)
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
