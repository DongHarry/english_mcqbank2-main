package com.example.english_mcqbank.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomErrorController implements ErrorController {
    @RequestMapping("/error")
    public ModelAndView handleError() {
        return new ModelAndView("error");
    }

    @RequestMapping("/access-denided")
    public ModelAndView accessDenied() {
        return new ModelAndView("access-denied");
    }
}
