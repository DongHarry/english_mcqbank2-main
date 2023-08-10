package com.example.english_mcqbank.controller.admin;

import com.example.english_mcqbank.model.Topic;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class TopicController {
    final UserDetailsServiceImpl userService;
    final LogService logService;
    final TopicService topicService;
    final QuestionService questionService;
    final PasswordEncoder passwordEncoder;
    final ExamService examService;
    final ResultService resultService;

    @RequestMapping(value = "/admin/topics", method = RequestMethod.GET)
    public ModelAndView topicList(@RequestParam(defaultValue = "0") int page,
                                  @RequestParam(defaultValue = "20") int size,
                                  Authentication authentication) {
        List<Topic> topics = topicService.getAllTopics();
        ModelAndView modelAndView = new ModelAndView("topics");
        modelAndView.addObject("topics", topics);
        UserEntity loggedInUser = userService.getUserByUsername(authentication.getName());
        modelAndView.addObject("loggedInUser", loggedInUser);
//        modelAndView.addObject("currentPage", page);
//        assert topics != null;
//        boolean hasNext = topics.size() >= size;
//        modelAndView.addObject("hasNext", hasNext);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/topics/new", method = RequestMethod.GET)
    public ModelAndView addTopic(Authentication authentication) {
        ModelAndView modelAndView = new ModelAndView("addTopic");
        UserEntity loggedInUser = userService.getUserByUsername(authentication.getName());
        modelAndView.addObject("loggedInUser", loggedInUser);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/addTopic", method = RequestMethod.POST)
    public ModelAndView addTopic(@RequestParam("name") String name,
                                 @RequestParam("description") String description,
                                 RedirectAttributes redirectAttributes) {
        if (topicService.existsByName(name)) {
            redirectAttributes.addFlashAttribute("e_message", "Topic " + name + " already exists");
            return new ModelAndView("redirect:/admin/topics/new");
        }

        try {
            Topic topic = new Topic();
            topic.setName(name);
            topic.setDescription(description);
            topicService.save(topic);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("e_message", "Error adding topic");
            return new ModelAndView("redirect:/admin/topics");
        }

        ModelAndView modelAndView1 = new ModelAndView("redirect:/admin/topics");
        redirectAttributes.addFlashAttribute("message", "Topic added successfully");
        return modelAndView1;
    }

    @RequestMapping(value = "/admin/topics/{id}/delete", method = RequestMethod.GET)
    public ModelAndView deleteTopic(@PathVariable int id, RedirectAttributes redirectAttributes) {
        Topic topic = topicService.getTopicById(id);
        if (topic == null) {
            redirectAttributes.addFlashAttribute("e_message", "Topic does not exist");
            return new ModelAndView("redirect:/admin/topics");
        }

        if (questionService.countAllByTopic(topic) > 0) {
            redirectAttributes.addFlashAttribute("e_message", "Topic has questions");
            return new ModelAndView("redirect:/admin/topics");
        }

        topicService.deleteTopic(topic);
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/topics");
        redirectAttributes.addFlashAttribute("message", "Topic deleted successfully");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/topics/{id}", method = RequestMethod.GET)
    public ModelAndView editTopic(@PathVariable int id, Model model, Authentication authentication) {
        ModelAndView modelAndView = new ModelAndView("editTopic");
        Topic topic = topicService.getTopicById(id);
        modelAndView.addObject("c_topic", topic);
        model.addAttribute("c_topic", topic);
        UserEntity loggedInUser = userService.getUserByUsername(authentication.getName());
        modelAndView.addObject("loggedInUser", loggedInUser);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/topics/{id}/edit", method = RequestMethod.POST)
    public ModelAndView editTopic(@PathVariable int id,
                                  @RequestParam("name") String topicName,
                                  @RequestParam("name2") String originalTopicName,
                                  @RequestParam("description") String topicDescription,
                                  RedirectAttributes redirectAttributes) {
        if (topicService.existsByName(topicName) && !topicName.equals(originalTopicName)) {
            redirectAttributes.addFlashAttribute("e_message", "Topic " + topicName + " already exists");
            ModelAndView modelAndView1 = new ModelAndView("redirect:/admin/topics/" + id);
            return modelAndView1;
        }

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/topics");
        Topic topic = new Topic();
        topic.setId(id);
        topic.setName(topicName);
        topic.setDescription(topicDescription);
        topicService.save(topic);

        redirectAttributes.addFlashAttribute("message", "Topic edited successfully");
        return modelAndView;
    }
}
