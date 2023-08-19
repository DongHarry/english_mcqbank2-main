package com.example.english_mcqbank.controller;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequiredArgsConstructor
public class ResetPasswordController {
    final UserDetailsServiceImpl userService;
    final ILogService logService;
    final IExamService examService;
    final PasswordEncoder passwordEncoder;
    final IEmailSender emailSender;
    final VerifyService verifyService;

    @RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
    public ModelAndView forgotPassword() {
        return new ModelAndView("forgot-password");
    }

    @RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
    public ModelAndView forgotPasswordHandle(@RequestParam("name") String name, HttpServletRequest request,
                                             RedirectAttributes redirectAttributes) {

        if (name == null || name.isEmpty()) {
            ModelAndView modelAndView = new ModelAndView("redirect:/forgot-password");
            //modelAndView.addObject("message2", "Please enter your username!");
            redirectAttributes.addFlashAttribute("message2", "Please enter your username!");
            return modelAndView;
        }

        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();

        if (name.contains("@")) {
            UserEntity user = userService.getUserByEmail(name);
            if (user == null) {
                ModelAndView modelAndView = new ModelAndView("redirect:/forgot-password");
                //modelAndView.addObject("message2", "Email not found!");
                redirectAttributes.addFlashAttribute("message2", "Email not found!");
                return modelAndView;
            }
            emailSender.sendResetPasswordEmail(user, url);
        } else {
            UserEntity user = userService.getUserByUsername(name);
            if (user == null) {
                ModelAndView modelAndView = new ModelAndView("redirect:/forgot-password");
                //modelAndView.addObject("message2", "Username not found!");
                redirectAttributes.addFlashAttribute("message2", "Username not found!");
                return modelAndView;
            }
            emailSender.sendResetPasswordEmail(user, url);
        }

        ModelAndView modelAndView = new ModelAndView("redirect:/login-page");
        //modelAndView.addObject("message3", "Please check your email to reset password!");
        redirectAttributes.addFlashAttribute("message3", "Please check your email to reset password!");
        return modelAndView;
    }

    @RequestMapping(value = "/reset-password", method = RequestMethod.GET)
    public ModelAndView resetPassword(@RequestParam("token") String token, RedirectAttributes redirectAttributes) {
        int userId = verifyService.getUserIdByVerifyToken(token);
        if (userId == -1) {
            ModelAndView modelAndView = new ModelAndView("redirect:/forgot-password");
            //modelAndView.addObject("errorMessage3", "Token not found!");
            redirectAttributes.addFlashAttribute("errorMessage3", "Token not found!");
            return modelAndView;
        }

        UserEntity user = userService.getUserByUserid(userId);
        if (user == null) {
            ModelAndView modelAndView = new ModelAndView("redirect:/forgot-password");
            //modelAndView.addObject("errorMessage3", "Token not found!");
            redirectAttributes.addFlashAttribute("errorMessage3", "Token not found!");
            return modelAndView;
        }

        ModelAndView modelAndView = new ModelAndView("reset-password");
        modelAndView.addObject("token", token);
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/reset-password", method = RequestMethod.POST)
    public ModelAndView resetPasswordHandle(@RequestParam("password") String password,
                                            @RequestParam("confirmPassword") String confirm,
                                            @RequestParam("token") String token,
                                            RedirectAttributes redirectAttributes) {
        int userId = verifyService.getUserIdByVerifyToken(token);
        if (userId == -1) {
            ModelAndView modelAndView = new ModelAndView("redirect:/forgot-password");
            //modelAndView.addObject("message3", "Token not found!");
            redirectAttributes.addFlashAttribute("errorMessage3", "Token not found!");
            return modelAndView;
        }

        UserEntity user = userService.getUserByUserid(userId);
        if (user == null) {
            ModelAndView modelAndView = new ModelAndView("redirect:/login-page");
            //modelAndView.addObject("message3", "Token not found!");
            redirectAttributes.addFlashAttribute("errorMessage3", "Token not found!");
            System.out.println("Token not found!");
            return modelAndView;
        }

        if (!password.equals(confirm)) {
            ModelAndView modelAndView = new ModelAndView("redirect:/reset-password?token=" + token);
            //modelAndView.addObject("message1", "Password and confirm password not match!");
            redirectAttributes.addFlashAttribute("message1", "Password and confirm password not match!");
            return modelAndView;
        }

        user.setPassword(passwordEncoder.encode(password));
        userService.saveUser(user);
        ModelAndView modelAndView = new ModelAndView("redirect:/login-page");
        //modelAndView.addObject("message3", "Reset password successfully!");
        redirectAttributes.addFlashAttribute("message3", "Reset password successfully!");
        //System.out.println("Reset password successfully!");
        Log log = new Log();
        log.setName("User " + user.getUsername() + " reset password successfully");
        log.setDatetime(new Date());
        log.setStatus(1);
        log.setUser(user);
        logService.saveLog(log);

        return modelAndView;
    }
}
