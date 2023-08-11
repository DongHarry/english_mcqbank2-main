package com.example.english_mcqbank.controller;


import com.example.english_mcqbank.model.*;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {
    final UserDetailsServiceImpl userService;
    final ILogService logService;
    final ITopicService topicService;
    final IQuestionService questionService;
    final PasswordEncoder passwordEncoder;
    final IExamService examService;
    final IResultService resultService;

    @RequestMapping("/admin")
    public ModelAndView admin(Authentication authentication) {
        ModelAndView adminModelAndView = new ModelAndView("admin");
        adminModelAndView.addObject("admin", "admin");
        //List<UserEntity> users = userService.getAllUsers();
        //adminModelAndView.addObject("users", users);
        UserEntity user = userService.getUserByUsername(authentication.getName());
        adminModelAndView.addObject("user", user);
        adminModelAndView.addObject("type", 1);
        return adminModelAndView; // Trả về admin.jsp
    }
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

    @RequestMapping("/admin/test1")
    public ModelAndView test1() {
        ModelAndView view = new ModelAndView("test1");
        List<Topic> topics = topicService.getAllTopics();
        view.addObject("topics", topics);
        return view; // Trả về admin.jsp
    }
}
