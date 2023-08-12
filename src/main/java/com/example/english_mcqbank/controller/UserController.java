package com.example.english_mcqbank.controller;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.Result;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class UserController {
    final UserDetailsServiceImpl userService;
    final ILogService logService;
    final IExamService examService;
    final IQuestionService questionService;
    final IResultService resultService;
    final ISessionService sessionService;
    final PasswordEncoder passwordEncoder;
    //final LoggedInUserService loggedInUserService;

    @RequestMapping("/user")
    public ModelAndView user() {
        ModelAndView userModelAndView = new ModelAndView("user");
        userModelAndView.addObject("user", sessionService.getLoggedInUser());
        return userModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/profile")
    public ModelAndView userProfile() {
        ModelAndView userProfileModelAndView = new ModelAndView("profile");
        userProfileModelAndView.addObject("successMessage", null);
        userProfileModelAndView.addObject("errorMessage", null);

        UserEntity user = sessionService.getLoggedInUser();
        //UserEntity user = loggedInUserService.getLoggedInUser();
        userProfileModelAndView.addObject("user", user);
        userProfileModelAndView.addObject("loggedInUser", user);
        userProfileModelAndView.addObject("type", 1);

        return userProfileModelAndView; // Trả về user.jsp
    }

    @RequestMapping("/user/profile/logs")
    public ModelAndView userLogs(@RequestParam(defaultValue = "0") int page,
                                 @RequestParam(defaultValue = "20") int size) {

        UserEntity user = sessionService.getLoggedInUser();
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
    public ModelAndView userResult(@RequestParam(defaultValue = "0") int page,
                                   @RequestParam(defaultValue = "15") int size,
                                   RedirectAttributes redirectAttributes) {

        UserEntity user = sessionService.getLoggedInUser();
        //UserEntity user = loggedInUserService.getLoggedInUser();

        if (user == null) {
            return new ModelAndView("redirect:/user/profile");
        }

        //List<Result> results = user.getResults();
        List<Result> results = resultService.findAllByUser(user);

        if (results == null || results.isEmpty()) {
            ModelAndView profileModelAndView = new ModelAndView("redirect:/user/profile");
            redirectAttributes.addFlashAttribute("errorMessage2", "You have not taken any exam yet!");
            return profileModelAndView;
        }

        ModelAndView userResultModelAndView = new ModelAndView("userResult");
        userResultModelAndView.addObject("results", results);
        userResultModelAndView.addObject("loggedInUser", user);
        return userResultModelAndView; // Trả về user.jsp
    }
}
