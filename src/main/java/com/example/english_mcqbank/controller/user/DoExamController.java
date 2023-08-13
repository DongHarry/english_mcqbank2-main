package com.example.english_mcqbank.controller.user;

import com.example.english_mcqbank.model.*;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

@Controller
@RequiredArgsConstructor
public class DoExamController {
    final UserDetailsServiceImpl userService;
    final ILogService logService;
    final IExamService examService;
    final IQuestionService questionService;
    final IResultService resultService;
    final ISessionService sessionService;

    @RequestMapping("/user/exams")
    public ModelAndView userExams(@RequestParam(defaultValue = "0") int page,
                                  @RequestParam(defaultValue = "20") int size,
                                  Authentication authentication) {
        List<Exam> exams = examService.getAllExams();
        ModelAndView userExamsModelAndView = new ModelAndView("exams");
        UserEntity user = userService.getUserByUsername(authentication.getName());
        userExamsModelAndView.addObject("loggedInUser", user);
        userExamsModelAndView.addObject("exams", exams);
//        userExamsModelAndView.addObject("currentPage", page);
//        assert exams != null;
//        boolean hasNext = exams.size() >= size;
//        userExamsModelAndView.addObject("hasNext", hasNext);
        return userExamsModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/exams/{id}")
    public ModelAndView userExam(@PathVariable int id, RedirectAttributes redirectAttributes) {
        Exam exam = examService.getExamById(id);
        if (exam == null) {
            return new ModelAndView("redirect:/user/exams");
        }

        /*
        if (resultService.existsByExamAndUser(exam, sessionService.getLoggedInUser())) {
            ModelAndView modelAndView = new ModelAndView("redirect:/user/exams");
            redirectAttributes.addFlashAttribute("errorMessage", "You have already done this exam");
            return modelAndView;
        }
        */

        ModelAndView userExamModelAndView = new ModelAndView("exam");
        userExamModelAndView.addObject("exam", exam);
        userExamModelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        return userExamModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/exams/{id}/do")
    public ModelAndView doExam(@PathVariable int id) {
        ModelAndView userExamModelAndView = new ModelAndView("doExam");
        Exam exam = examService.getExamById(id);
        if (exam == null) {
            return new ModelAndView("redirect:/user/exams");
        }

        /*
        if (resultService.existsByExamAndUser(exam, sessionService.getLoggedInUser())) {
            ModelAndView modelAndView = new ModelAndView("redirect:/user/exams");
            redirectAttributes.addFlashAttribute("errorMessage", "You have already done this exam");
            return modelAndView;
        }
        */

        //int topicId = exam.getTopicId();
        int questionCount = exam.getQuestionNo();
        List<ExamTopic> examTopics = exam.getExamTopicList();
        int examType = exam.getType();
        //List<Question> questions = questionService.getRandom(topicId, 0, questionCount);
        List<Question> questions = new ArrayList<>();
        for (ExamTopic examTopic: examTopics) {
            List<Question> questions1 =
                    questionService.getRandom(examTopic.getTopic().getId(), 0,
                            (int) Math.round(questionCount * examTopic.getPercent() / 100.0), examType);
            questions.addAll(questions1);
        }
//        questionMap = new HashMap<>();
//        for (Question question : questions) {
//            questionMap.put(question.getId(), question);
//        }
        Collections.shuffle(questions);
        userExamModelAndView.addObject("questions", questions);
        userExamModelAndView.addObject("examId", exam.getId());
        return userExamModelAndView; // Trả về user.jsp
    }

    @RequestMapping(value = "/user/exams/doExam", method = RequestMethod.POST)
    public ModelAndView doExam2(@RequestParam("examId") int id) {
        ModelAndView userExamModelAndView = new ModelAndView("doExam");
        Exam exam = examService.getExamById(id);
        if (exam == null) {
            return new ModelAndView("redirect:/user/exams");
        }

        /*
        if (resultService.existsByExamAndUser(exam, sessionService.getLoggedInUser())) {
            ModelAndView modelAndView = new ModelAndView("redirect:/user/exams");
            redirectAttributes.addFlashAttribute("errorMessage", "You have already done this exam");
            return modelAndView;
        }
        */

        int questionCount = exam.getQuestionNo();
        List<ExamTopic> examTopics = exam.getExamTopicList();
        int examType = exam.getType();
        List<Question> questions = new ArrayList<>();
        for (ExamTopic examTopic: examTopics) {
            List<Question> questions1 =
                    questionService.getRandom(examTopic.getTopic().getId(), 0,
                            (int) Math.round(questionCount * examTopic.getPercent() / 100.0), examType);
            questions.addAll(questions1);
        }

        Collections.shuffle(questions);
        userExamModelAndView.addObject("questions", questions);
        userExamModelAndView.addObject("exam", exam);
        return userExamModelAndView; // Trả về user.jsp
    }

    @PostMapping("/user/exams/submit")
    public ModelAndView submitAnswers(@RequestParam Map<String, String> params,
                                      Authentication authentication,
                                      @RequestParam("examId") String examId) {
        // Process the submitted form data
        Exam exam = examService.getExamById(Integer.parseInt(examId));
        int totalQuestions = exam.getQuestionNo();
        int score = examService.calculateScore(params);
        // Redirect or return a response as needed
        ModelAndView modelAndView = new ModelAndView("resultPage");
        modelAndView.addObject("score", score);
        modelAndView.addObject("totalQuestions", totalQuestions);


        UserEntity user = userService.getUserByUsername(authentication.getName());

        Result result = new Result();
        result.setScore(score);
        result.setTime(new Date());
        //result.setExamId(examId);
        result.setExam(exam);
        user.addResult(result);
        userService.saveUser(user);
        return modelAndView;
    }

    @RequestMapping("/user/exams/{id}/results")
    public ModelAndView userExamResult(@PathVariable int id, Authentication authentication) {
        Exam exam = examService.getExamById(id);
        if (exam == null) {
            return new ModelAndView("redirect:/user/exams");
        }

        ModelAndView userExamModelAndView = new ModelAndView("userResult");
        userExamModelAndView.addObject("exam", exam);
        UserEntity user = userService.getUserByUsername(authentication.getName());
        userExamModelAndView.addObject("loggedInUser", user);
        List<Result> results = resultService.findAllByExamAndOrderByScore(exam);
        userExamModelAndView.addObject("results", results);
        userExamModelAndView.addObject("ranking", true);

        return userExamModelAndView; // Trả về user.jsp
    }
}
