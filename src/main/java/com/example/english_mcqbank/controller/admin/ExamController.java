package com.example.english_mcqbank.controller.admin;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.Result;
import com.example.english_mcqbank.model.Topic;
import com.example.english_mcqbank.model.UserEntity;
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
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class ExamController {
    final UserDetailsServiceImpl userService;
    final ILogService logService;
    final ITopicService topicService;
    final IQuestionService questionService;
    final IExamService examService;
    final IResultService resultService;
    final SessionService sessionService;

    @RequestMapping(value = "/admin/exams/new", method = RequestMethod.GET)
    public ModelAndView addExam() {
        List<Topic> topics = topicService.getAllTopics();
        ModelAndView modelAndView = new ModelAndView("addExam");
        modelAndView.addObject("topics", topics);
        //modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        return modelAndView;
    }

    @RequestMapping(value = "/admin/addExam", method = RequestMethod.POST)
    public ModelAndView addExam(@RequestParam("questionNo") String questionNo,
                                @RequestParam("examName") String examName,
                                @RequestParam("examType") int examType,
                                @RequestParam Map<String, String> requestParams,
                                RedirectAttributes redirectAttributes) {

        // Tạo một Map để chứa topicId và numOfQu tương ứng
        Map<Long, Integer> examTopicPercentageMap = examService.getExamTopicPercentageMap(requestParams);
        int totalPercentage = examService.getTotalPercentage(examTopicPercentageMap);
        if (totalPercentage != 100) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/exams/new");
            redirectAttributes.addFlashAttribute("e_message", "Total percentage must be 100");
            return modelAndView;
        }

        // Duyệt qua các tham số trong requestParams để tách giá trị numOfQu tương ứng với từng topicId
        // Sau khi có Map mới tương ứng <topicId, numOfQu>, bạn có thể thực hiện các thao tác cần thiết với dữ liệu này.
        Exam exam = new Exam();
        exam.setQuestionNo(Integer.parseInt(questionNo));
        exam.setTime(new Date());
        exam.setName(examName);
        exam.setType(examType);
        examService.addExamTopic(exam, examTopicPercentageMap);
        examService.saveExam(exam);

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/exams");
        //modelAndView.addObject("message", "Exam added successfully");
        redirectAttributes.addFlashAttribute("message", "Exam added successfully");
        // Redirect hoặc trả về view (tùy vào logic của ứng dụng)
        return modelAndView; // Thay thế "path-to-some-page" bằng đường dẫn mong muốn
    }

    @RequestMapping(value = "/admin/exams", method = RequestMethod.GET)
    public ModelAndView exams(@RequestParam(defaultValue = "0") int page,
                              @RequestParam(defaultValue = "10") int size) {
        ModelAndView modelAndView = new ModelAndView("exams");

        //modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());

        List<Exam> exams = examService.getAllExams();
//        List<Exam> exams = examService.getAllExams(page, size);
        modelAndView.addObject("exams", exams);
//        modelAndView.addObject("currentPage", page);
//        assert exams != null;
//        boolean hasNext = exams.size() >= size;
//        modelAndView.addObject("hasNext", hasNext);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/exams/{examId}", method = RequestMethod.GET)
    public ModelAndView exam(@PathVariable("examId") int examId, Model model) {
        ModelAndView modelAndView = new ModelAndView("editExam");
        Exam exam = examService.getExamById(examId);
        modelAndView.addObject("c_exam", exam);
        model.addAttribute("c_exam", exam);
        List<Topic> topics = topicService.getAllTopics();
        modelAndView.addObject("topics", topics);
        //modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());

        return modelAndView;
    }

    @RequestMapping(value = "/admin/exams/{examId}/edit", method = RequestMethod.POST)
    public ModelAndView editExam(@PathVariable("examId") int examId,
                                 @ModelAttribute("c_exam") Exam c_exam, Model model,
                                 @RequestParam Map<String, String> requestParams,
                                 RedirectAttributes redirectAttributes) {

        Exam exam = examService.getExamById(examId);
        Map<Long, Integer> examTopicPercentageMap = examService.getExamTopicPercentageMap(requestParams);
        int totalPercentage = examService.getTotalPercentage(examTopicPercentageMap);

        if (totalPercentage != 100) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/exams/" + examId);
            redirectAttributes.addFlashAttribute("e_message", "Total percentage must be 100");
            return modelAndView;
        }

        examService.updateExamTopic(exam, examTopicPercentageMap);

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/exams");
        if (c_exam != null) {
            exam.setName(c_exam.getName());
            if (c_exam.getQuestionNo() != null) exam.setQuestionNo(c_exam.getQuestionNo());
            exam.setType(c_exam.getType());
            redirectAttributes.addFlashAttribute("message", "Exam: " +c_exam.getName()+ " updated successfully");
        }

        examService.saveExam(exam);
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

    @RequestMapping(value = "/admin/exams/{examId}/results", method = RequestMethod.GET)
    public ModelAndView results(@RequestParam(defaultValue = "0") int page,
                                @RequestParam(defaultValue = "10") int size,
                                @PathVariable("examId") int examId,
                                RedirectAttributes redirectAttributes) {
        Exam exam = examService.getExamById(examId);
        List<Result> results = resultService.findAllByExamAndOrderByScore(exam);

        if (results == null || results.isEmpty()) {
            ModelAndView modelAndView1 = new ModelAndView("redirect:/admin/exams");
            redirectAttributes.addFlashAttribute("e_message", "No results found for exam: " + examId);
            return modelAndView1;
        }

        ModelAndView modelAndView = new ModelAndView("userResult");
        modelAndView.addObject("results", results);
        modelAndView.addObject("ranking", true);
        //modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        modelAndView.addObject("type", 2);
        modelAndView.addObject("title", "All Users results for exam " + examId);
//        modelAndView.addObject("currentPage", page);
//        assert results != null;
//        boolean hasNext = results.size() >= size;
//        modelAndView.addObject("hasNext", hasNext);
        //modelAndView.addObject("examId", examId);
        return modelAndView;
    }

}
