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
    final LogService logService;
    final TopicService topicService;
    final QuestionService questionService;
    final PasswordEncoder passwordEncoder;
    final ExamService examService;
    final ResultService resultService;

    @RequestMapping(value = "/admin/questions", method = RequestMethod.GET)
    public ModelAndView questionList(@RequestParam(defaultValue = "0") int page,
                                     @RequestParam(defaultValue = "20") int size,
                                     Authentication authentication) {
        List<Question> questions = questionService.getAllQuestions();
        ModelAndView modelAndView = new ModelAndView("questionList");
        UserEntity loggedInUser = userService.getUserByUsername(authentication.getName());
        modelAndView.addObject("loggedInUser", loggedInUser);
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

    @RequestMapping(value = "/admin/questions/{id}", method = RequestMethod.GET)
    public ModelAndView editQuestion(@PathVariable("id") int id, Model model, Authentication authentication) {
        Question question = questionService.getQuestionById(id);

        ModelAndView modelAndView = new ModelAndView("editQuestion");
        modelAndView.addObject("loggedInUser", userService.getUserByUsername(authentication.getName()));
        modelAndView.addObject("c_question", question);
        model.addAttribute("c_question", question);

        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/{id}/edit", method = RequestMethod.POST)
    public ModelAndView editQuestionHandle(@ModelAttribute("c_question") Question c_question,
                                           RedirectAttributes redirectAttributes) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");
        Question question = questionService.getQuestionById(c_question.getId());

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
}
