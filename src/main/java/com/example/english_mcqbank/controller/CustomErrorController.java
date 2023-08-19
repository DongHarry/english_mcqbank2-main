package com.example.english_mcqbank.controller;

import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.ISessionService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class CustomErrorController implements ErrorController {
    private final ISessionService sessionService;
    @RequestMapping("/error")
    public ModelAndView handleError() {
        ModelAndView modelAndView = new ModelAndView("error");
        UserEntity loggedInUser = sessionService.getLoggedInUser();
        if (loggedInUser != null) {
            modelAndView.addObject("loggedInUser", loggedInUser);
        }
        return modelAndView;
    }

    @RequestMapping("/access-denided")
    public ModelAndView accessDenied() {
        return new ModelAndView("access-denied");
    }
}
