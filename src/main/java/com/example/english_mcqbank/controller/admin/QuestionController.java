package com.example.english_mcqbank.controller.admin;

import com.example.english_mcqbank.model.Question;
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

import java.util.List;

@Controller
@RequiredArgsConstructor
public class QuestionController {
    final UserDetailsServiceImpl userService;
    final ILogService logService;
    final ITopicService topicService;
    final IQuestionService questionService;
    final IExamService examService;
    final IResultService resultService;
    final ISessionService sessionService;

    @RequestMapping(value = "/admin/questions", method = RequestMethod.GET)
    public ModelAndView questionList(@RequestParam(defaultValue = "0") int page,
                                     @RequestParam(defaultValue = "20") int size) {
        List<Question> questions = questionService.getAllQuestions();
        ModelAndView modelAndView = new ModelAndView("questionList");

        modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        modelAndView.addObject("questions", questions);
//        modelAndView.addObject("currentPage", page);
//        assert questions != null;
//        boolean hasNext = questions.size() >= size;
//        modelAndView.addObject("hasNext", hasNext);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/new", method = RequestMethod.GET)
    public ModelAndView addQuestion() {
        List<Topic> topics = topicService.getAllTopics();
        ModelAndView modelAndView = new ModelAndView("addQuestion");
        modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        modelAndView.addObject("topics", topics);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/addQuestion", method = RequestMethod.POST)
    public ModelAndView addQuestion(@RequestParam("content") String content,
                                    @RequestParam("option1") String option1,
                                    @RequestParam("option2") String option2,
                                    @RequestParam("option3") String option3,
                                    @RequestParam("option4") String option4,
                                    @RequestParam("answer") int correctAnswer,
                                    @RequestParam("explain") String explain,
                                    @RequestParam("topicId") int topicId,
                                    @RequestParam("level") int level,
                                    RedirectAttributes redirectAttributes) {
        if (questionService.existByContent(content)) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions/new");
            redirectAttributes.addFlashAttribute("message", "Question already exists");
            return modelAndView;
        }

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");

        Question newQuestion = new Question();
        newQuestion.setContent(content);
        newQuestion.setOption1(option1);
        newQuestion.setOption2(option2);
        newQuestion.setOption3(option3);
        newQuestion.setOption4(option4);
        newQuestion.setAnswer(correctAnswer);
        newQuestion.setExplain(explain);
        newQuestion.setLevel(level);
        newQuestion.setTopic(topicService.getTopicById(topicId));
        newQuestion.setType(1);
        questionService.save(newQuestion);

        redirectAttributes.addFlashAttribute("message", "Question: " + newQuestion.getId().toString() + " added successfully");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/{id}", method = RequestMethod.GET)
    public ModelAndView editQuestion(@PathVariable("id") int id, Model model) {
        Question question = questionService.getQuestionById(id);

        ModelAndView modelAndView = new ModelAndView("editQuestion");
        modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        modelAndView.addObject("c_question", question);
        model.addAttribute("c_question", question);

        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/{id}/edit", method = RequestMethod.POST)
    public ModelAndView editQuestionHandle(@ModelAttribute("c_question") Question c_question,
                                           RedirectAttributes redirectAttributes) {

        Question question = questionService.getQuestionById(c_question.getId());
        if (questionService.existByContent(c_question.getContent()) && !question.getContent().equals(c_question.getContent())) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions/" + c_question.getId().toString());
            redirectAttributes.addFlashAttribute("e_message", "Question already exists");
            return modelAndView;
        }

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");
        if (question != null) {
            question.setContent(c_question.getContent());
            question.setAnswer(c_question.getAnswer());
            question.setOption1(c_question.getOption1());
            question.setOption2(c_question.getOption2());
            question.setOption3(c_question.getOption3());
            question.setOption4(c_question.getOption4());
            question.setExplain(c_question.getExplain());
            question.setLevel(c_question.getLevel());
            questionService.save(question);
            redirectAttributes.addFlashAttribute("message", "Question: " + question.getId().toString() + " updated successfully");
        }

        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/{id}/delete", method = RequestMethod.GET)
    public ModelAndView deleteQuestion(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
        Question question = questionService.getQuestionById(id);

        if (question != null) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");
            questionService.delete(question);
            redirectAttributes.addFlashAttribute("message", "Question: " + question.getId().toString() + " deleted successfully");
            return modelAndView;
        }

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");
        redirectAttributes.addFlashAttribute("e_message", "Question: " + (question != null ? question.getId().toString() : null) + " deleted failed");
        return modelAndView;
    }
}
