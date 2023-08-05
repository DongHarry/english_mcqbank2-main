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
public class UserController {
    final UserDetailsServiceImpl userService;
    final LogService logService;
    final ExamService examService;
    final QuestionService questionService;
    final ResultService resultService;
    final PasswordEncoder passwordEncoder;
    //final LoggedInUserService loggedInUserService;
    private Map<Integer, Question> questionMap;

    @RequestMapping("/user/profile")
    public ModelAndView userProfile(Authentication authentication) {
        ModelAndView userProfileModelAndView = new ModelAndView("profile");
        userProfileModelAndView.addObject("successMessage", null);
        userProfileModelAndView.addObject("errorMessage", null);
        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        //UserEntity user = loggedInUserService.getLoggedInUser();
        userProfileModelAndView.addObject("user", user);

        return userProfileModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/profile/logs")
    public ModelAndView userLogs(Authentication authentication,
                                 @RequestParam(defaultValue = "0") int page,
                                 @RequestParam(defaultValue = "20") int size) {
        ModelAndView userLogsModelAndView = new ModelAndView("logs");
        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        //UserEntity user = loggedInUserService.getLoggedInUser();
        if (user == null) {
            return new ModelAndView("redirect:/user/profile");
        }

        List<Log> logs = logService.getLogsByUser(user, page, size);
        userLogsModelAndView.addObject("logs", logs);
        userLogsModelAndView.addObject("currentPage", page);
        assert logs != null;
        boolean hasNext = logs.size() >= size;
        userLogsModelAndView.addObject("hasNext", hasNext);
        return userLogsModelAndView; // Trả về user.jsp
    }

    @RequestMapping(value = "/user/profile/edit", method = RequestMethod.GET)
    public ModelAndView editUserProfile(Authentication authentication, Model model) {
        ModelAndView editUserModelAndView = new ModelAndView("editUser");
        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        //UserEntity user = loggedInUserService.getLoggedInUser();
        if (user == null) {
            return new ModelAndView("redirect:/user/profile");
        }
        //editUserModelAndView.addObject("user", user);
        model.addAttribute("currentUser", user);
        return editUserModelAndView; // Trả về user.jsp
    }

    @RequestMapping(value = "/user/profile/change-password", method = RequestMethod.GET)
    public ModelAndView changePassword() {
        ModelAndView changePasswordModelAndView = new ModelAndView("change-password");

        return changePasswordModelAndView; // Trả về user.jsp
    }
    @RequestMapping(value = "/user/profile/change-password", method = RequestMethod.POST)
    public ModelAndView changePassword(@RequestParam("oldPassword") String oldPassword,
                                       @RequestParam("newPassword") String newPassword,
                                       @RequestParam("confirmNewPassword") String confirmNewPassword,
                                       Authentication authentication, RedirectAttributes redirectAttributes) {
        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        //UserEntity user = loggedInUserService.getLoggedInUser();
        boolean check = passwordEncoder.matches(oldPassword, user.getPassword());
        if (!check) {
            //redirectAttributes.addFlashAttribute("errorMessage", "Incorrect password!");
            ModelAndView view = new ModelAndView("change-password");
            view.addObject("errorMessage", "Incorrect password!");
            //return new ModelAndView("redirect:/user/profile/change-password");
            return view;
        }

        if (newPassword.equals(confirmNewPassword)) {
            user.setPassword(passwordEncoder.encode(newPassword));
            userService.saveUser(user);
            //redirectAttributes.addFlashAttribute("successMessage", "Update Password successfully!");
            ModelAndView view = new ModelAndView("redirect:/user/profile");
            view.addObject("successMessage", "Update Password successfully!");
            return view;
        }

//        redirectAttributes.addFlashAttribute("errorMessage", "Password and Confirm Password do not match!");
//
//        return new ModelAndView("redirect:/user/profile/change-password");
        ModelAndView view = new ModelAndView("change-password");
        view.addObject("errorMessage", "Password and Confirm Password do not match!");
        return view;
    }

    @RequestMapping(value = "/user/profile/edit", method = RequestMethod.POST)
    public ModelAndView editUserProfile(Authentication authentication,
                                        @ModelAttribute("currentUser") UserEntity user,
                                        RedirectAttributes redirectAttributes) {
        ModelAndView editUserModelAndView = new ModelAndView("editUser");
        String username = authentication.getName();
        UserEntity userEntity = userService.getUserByUsername(username);
        //UserEntity userEntity = loggedInUserService.getLoggedInUser();
        if (userEntity == null) {
            ModelAndView view = new ModelAndView("profile");
            view.addObject("errorMessage", "User not found!");
            return view;
        }

        userEntity.setFullName(user.getFullName());
        if (!user.getEmail().equals(userEntity.getEmail()) && userService.isEmailPresent(user.getEmail())) {
            //redirectAttributes.addFlashAttribute("errorMessage", "Email is already in use!");
            editUserModelAndView.addObject("errorMessage", "Email is already in use!");
            return editUserModelAndView;
        } else {
            userEntity.setEmail(user.getEmail());
        }
        if (!user.getPhone().equals(userEntity.getPhone()) && userService.isPhonePresent(user.getPhone())) {
            //redirectAttributes.addFlashAttribute("errorMessage", "Phone is already in use!");
            editUserModelAndView.addObject("errorMessage", "Phone is already in use!");
            return editUserModelAndView;
        } else {
            userEntity.setPhone(user.getPhone());
        }
        userEntity.setAddress(user.getAddress());

        try {
            userService.saveUser(userEntity);
            //redirectAttributes.addFlashAttribute("successMessage", "Update profile successfully!");
            ModelAndView view = new ModelAndView("redirect:/user/profile");
            //redirectAttributes.addFlashAttribute("user", userEntity);
            view.addObject("successMessage", "Update profile successfully!");
            return view;
            //return new ModelAndView("redirect:/user/profile");
        } catch (Exception e) {
            return editUserModelAndView;
        }
    }

    @RequestMapping("/user/exams")
    public ModelAndView userExams() {
        List<Exam> exams = examService.getAllExams();
        ModelAndView userExamsModelAndView = new ModelAndView("exams");
        userExamsModelAndView.addObject("exams", exams);
        return userExamsModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/exams/{id}")
    public ModelAndView userExam(@PathVariable int id) {
        ModelAndView userExamModelAndView = new ModelAndView("questionList");
        Exam exam = examService.getExamById(id);
        if (exam == null) {
            return new ModelAndView("redirect:/user/exams");
        }
        int topicId = exam.getTopicId();
        int questionCount = exam.getQuestionNo();
        List<ExamTopic> examTopics = exam.getExamTopicList();

        List<Question> questions = questionService.getRandom(topicId, 0, questionCount);
        questionMap = new HashMap<>();
        for (Question question : questions) {
            questionMap.put(question.getId(), question);
        }
        userExamModelAndView.addObject("questions", questions);
        userExamModelAndView.addObject("examId", exam.getId());
        return userExamModelAndView; // Trả về user.jsp
    }

    @PostMapping("/user/exams/submit")
    public ModelAndView submitAnswers(@RequestParam Map<String, String> params, Authentication authentication,
                                      @RequestParam("examId") int examId) {
        // Process the submitted form data
        Integer score = 0;
        int totalQuestions = 0;
        // sort question by id

        for (String paramName : params.keySet()) {
            if (paramName.startsWith("question_")) {
                int questionId = Integer.parseInt(paramName.substring("question_".length()));
                //Question question = questionService.get(questionId);
                Question question = questionMap.get(questionId);
                String selectedOption = params.get(paramName);
                // Do something with the selected option for each question (e.g., save to database)
                if (selectedOption.equals(question.getCorrectAnswer())) {
                    score++;
                }
                //System.out.println("Question " + questionId + ": Selected Option: " + selectedOption);
                totalQuestions++;
            }

        }

        // Redirect or return a response as needed
        ModelAndView modelAndView = new ModelAndView("resultPage");
        modelAndView.addObject("score", score);
        modelAndView.addObject("totalQuestions", totalQuestions);
        questionMap.clear();

        UserEntity user = userService.getUserByUsername(authentication.getName());

        Result result = new Result();
        result.setScore(score);
        result.setTime(new Date());
        //result.setExamId(examId);
        result.setExam(examService.getExamById(examId));
        user.addResult(result);
        userService.saveUser(user);
        return modelAndView;
    }

    @RequestMapping("/user/results")
    public ModelAndView userResult(Authentication authentication,
                                   @RequestParam(defaultValue = "0") int page,
                                   @RequestParam(defaultValue = "5") int size) {
        ModelAndView userResultModelAndView = new ModelAndView("userResult");
        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        //UserEntity user = loggedInUserService.getLoggedInUser();
        if (user == null) {
            return new ModelAndView("redirect:/user/profile");
        }
        //List<Result> results = user.getResults();
        List<Result> results = resultService.findAllByUser(user, page, size);
        userResultModelAndView.addObject("results", results);
        userResultModelAndView.addObject("currentPage", page);
        assert results != null;
        boolean hasNext = results.size() >= size;
        userResultModelAndView.addObject("hasNext", hasNext);
        //userResultModelAndView.addObject("user", user);
        userResultModelAndView.addObject("title", "Results of " + user.getFullName());
        return userResultModelAndView; // Trả về user.jsp
    }
}
