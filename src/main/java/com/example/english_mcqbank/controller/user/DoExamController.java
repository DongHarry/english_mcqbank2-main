package com.example.english_mcqbank.controller.user;

import com.example.english_mcqbank.model.*;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

@Controller
@RequiredArgsConstructor
public class DoExamController {
    private final UserDetailsServiceImpl userService;
    private final ILogService logService;
    private final IExamService examService;
    private final IQuestionService questionService;
    private final IResultService resultService;
    private final ISessionService sessionService;

    @RequestMapping("/user/exams")
    public ModelAndView userExams(@RequestParam(defaultValue = "1") int page,
                                  @RequestParam(defaultValue = "5") int size,
                                  Authentication authentication) {
        if (sessionService.getLoggedInUser().getRoles()[0].equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/exams");
        }

        List<Exam> exams = examService.getAllExams(page, size);
        ModelAndView userExamsModelAndView = new ModelAndView("examList");
        //UserEntity user = userService.getUserByUsername(authentication.getName());
        //userExamsModelAndView.addObject("loggedInUser", user);
        userExamsModelAndView.addObject("exams", exams);
        userExamsModelAndView.addObject("currentPage", page);
        assert exams != null;
        boolean hasNext = exams.size() >= size;
        userExamsModelAndView.addObject("hasNext", hasNext);
        //nếu chia hết totalPage = totalQuestion / size
        //nếu không chia hết totalPage = totalQuestion / size + 1
        int totalPages = examService.countAllExams() / size;
        if (examService.countAllExams() % size != 0) {
            totalPages++;
        }

        userExamsModelAndView.addObject("totalPages", totalPages);
        return userExamsModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/exams/{id}")
    public ModelAndView userExam(@PathVariable int id, RedirectAttributes redirectAttributes) {
        if (sessionService.getLoggedInUser().getRoles()[0].equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/exams");
        }

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
        //userExamModelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        return userExamModelAndView; // Trả về user.jsp
    }


    @RequestMapping(value = "/user/exams/doExam", method = RequestMethod.POST)
    public ModelAndView doExam(@RequestParam("examId") int id) {
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
        for (ExamTopic examTopic : examTopics) {
            List<Question> questions1 =
                    questionService.getRandom(examTopic.getTopic().getId(), 0,
                            (int) Math.round(questionCount * examTopic.getPercent() / 100.0), examType);
            questions.addAll(questions1);
        }

        Collections.shuffle(questions);
        userExamModelAndView.addObject("questions", questions);
        userExamModelAndView.addObject("exam", exam);
        int duration = exam.getQuestionNo() * 60;
        String minutes = duration / 60 + "";
        String seconds = duration % 60 + "";
        minutes = Integer.parseInt(minutes) < 10 ? "0" + minutes : minutes;
        seconds = Integer.parseInt(seconds) < 10 ? "0" + seconds : seconds;
        userExamModelAndView.addObject("o_duration", minutes + ":" + seconds);
        userExamModelAndView.addObject("duration", duration);

        return userExamModelAndView; // Trả về user.jsp
    }

    @RequestMapping(value = "/user/exams/submit", method = RequestMethod.POST)
    public ModelAndView submitAnswers(@RequestParam Map<String, String> params,
                                      Authentication authentication,
                                      @RequestParam("examId") String examId,
                                      RedirectAttributes redirectAttributes) {
        // Process the submitted form data
        Exam exam = examService.getExamById(Integer.parseInt(examId));
        int totalQuestions = exam.getQuestionNo();
        int score = examService.calculateScore(params);
        // Redirect or return a response as needed

        UserEntity user = userService.getUserByUsername(authentication.getName());
        Result result = new Result();
        result.setScore(score);
        result.setTime(new Date());
        //result.setExamId(examId);
        result.setExam(exam);
        user.addResult(result);
        userService.saveUser(user);


        redirectAttributes.addAttribute("score", score);
        redirectAttributes.addAttribute("totalQuestions", totalQuestions);
        ModelAndView modelAndView = new ModelAndView("redirect:/user/result");
        modelAndView.addObject("score", score);
        modelAndView.addObject("totalQuestions", totalQuestions);
        return modelAndView;
    }

    @RequestMapping("/user/result")
    public ModelAndView result() {
        if (sessionService.getLoggedInUser().getRoles()[0].equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin");
        }

        return new ModelAndView("resultPage");
    }

    @RequestMapping("/user/exams/{id}/results")
    public ModelAndView userExamResult(@PathVariable int id, Authentication authentication) {
        if (sessionService.getLoggedInUser().getRoles()[0].equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/exams/{id}/results");
        }

        Exam exam = examService.getExamById(id);
        if (exam == null) {
            return new ModelAndView("redirect:/user/exams");
        }

        ModelAndView userExamModelAndView = new ModelAndView("userResult");
        userExamModelAndView.addObject("exam", exam);
        UserEntity user = userService.getUserByUsername(authentication.getName());
        //userExamModelAndView.addObject("loggedInUser", user);
        List<Result> results = resultService.findAllByExamAndOrderByScore(exam);
        userExamModelAndView.addObject("results", results);
        userExamModelAndView.addObject("ranking", true);

        return userExamModelAndView; // Trả về user.jsp
    }
}
