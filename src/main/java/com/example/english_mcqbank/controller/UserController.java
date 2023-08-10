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

import java.util.*;

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

    @RequestMapping("/user")
    public ModelAndView user(Authentication authentication) {
        ModelAndView userModelAndView = new ModelAndView("user");
        userModelAndView.addObject("user", userService.getUserByUsername(authentication.getName()));
        return userModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/profile")
    public ModelAndView userProfile(Authentication authentication) {
        ModelAndView userProfileModelAndView = new ModelAndView("profile");
        userProfileModelAndView.addObject("successMessage", null);
        userProfileModelAndView.addObject("errorMessage", null);

        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        //UserEntity user = loggedInUserService.getLoggedInUser();
        userProfileModelAndView.addObject("user", user);
        userProfileModelAndView.addObject("loggedInUser", user);
        userProfileModelAndView.addObject("type", 1);

        return userProfileModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/profile/logs")
    public ModelAndView userLogs(Authentication authentication,
                                 @RequestParam(defaultValue = "0") int page,
                                 @RequestParam(defaultValue = "20") int size
                                 ) {

        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        //UserEntity user = loggedInUserService.getLoggedInUser();
        if (user == null) {
            return new ModelAndView("redirect:/user/profile");
        }
        ModelAndView userLogsModelAndView = new ModelAndView("logs");
        userLogsModelAndView.addObject("loggedInUser", user);
        List<Log> logs = logService.getLogsByUser(user);

        userLogsModelAndView.addObject("logs", logs);
//        userLogsModelAndView.addObject("currentPage", page);
//        assert logs != null;
//        boolean hasNext = logs.size() >= size;
//        userLogsModelAndView.addObject("hasNext", hasNext);
        return userLogsModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/results")
    public ModelAndView userResult(Authentication authentication,
                                   @RequestParam(defaultValue = "0") int page,
                                   @RequestParam(defaultValue = "15") int size) {
        ModelAndView userResultModelAndView = new ModelAndView("userResult");
        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        //UserEntity user = loggedInUserService.getLoggedInUser();

        if (user == null) {
            return new ModelAndView("redirect:/user/profile");
        }

        //List<Result> results = user.getResults();
        List<Result> results = resultService.findAllByUser(user);
        userResultModelAndView.addObject("results", results);
//        userResultModelAndView.addObject("currentPage", page);
//        assert results != null;
//        boolean hasNext = results.size() >= size;
//        userResultModelAndView.addObject("hasNext", hasNext);
        //userResultModelAndView.addObject("user", user);
        userResultModelAndView.addObject("title", "Results of " + user.getFullName());
        return userResultModelAndView; // Trả về user.jsp
    }
}
