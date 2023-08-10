package com.example.english_mcqbank.controller.user;

import com.example.english_mcqbank.model.*;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequiredArgsConstructor
public class DoExamController {
    final UserDetailsServiceImpl userService;
    final LogService logService;
    final ExamService examService;
    final QuestionService questionService;
    final ResultService resultService;
    final PasswordEncoder passwordEncoder;

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
    public ModelAndView userExam(@PathVariable int id) {
        ModelAndView userExamModelAndView = new ModelAndView("exam");
        Exam exam = examService.getExamById(id);
        if (exam == null) {
            return new ModelAndView("redirect:/user/exams");
        }
        userExamModelAndView.addObject("exam", exam);
        return userExamModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/exams/{id}/do")
    public ModelAndView doExam(@PathVariable int id) {
        ModelAndView userExamModelAndView = new ModelAndView("doExam");
        Exam exam = examService.getExamById(id);
        if (exam == null) {
            return new ModelAndView("redirect:/user/exams");
        }
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

    @PostMapping("/user/exams/submit")
    public ModelAndView submitAnswers(@RequestParam Map<String, String> params, Authentication authentication,
                                      @RequestParam("examId") int examId) {
        // Process the submitted form data
        Exam exam = examService.getExamById(examId);
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

}