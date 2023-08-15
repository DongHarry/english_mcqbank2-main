package com.example.english_mcqbank.controller;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.ILogService;
import com.example.english_mcqbank.service.UserDetailsServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
@RequiredArgsConstructor
public class LoginAndRegisterController {
    private final UserDetailsServiceImpl userService;
    private final ILogService logService;
    private final PasswordEncoder passwordEncoder;

    @RequestMapping("/login-page")
    public ModelAndView loginPage(Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated()) {
            UserEntity user = userService.getUserByUsername(authentication.getName());
            if (user != null) {
                if (user.getRoles()[0].equals("ROLE_ADMIN")) {
                    return new ModelAndView("redirect:/admin");
                } else if (user.getRoles()[0].equals("ROLE_USER")) {
                    return new ModelAndView("redirect:/user");
                }
            }
        }

        return new ModelAndView("login-page");
        //return new ModelAndView("fancy-login");
    }

    @RequestMapping("/logout-success")
    public ModelAndView logoutSuccess() {
        return new ModelAndView("logout-success");
    }


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("user", new UserEntity());
        model.addAttribute("confirmPassword", "");
        return "register";
    }

    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public ModelAndView registerProcess(@ModelAttribute("user") UserEntity user, @ModelAttribute("confirmPassword") String confirmPassword,
                                        Model model, RedirectAttributes redirectAttributes) {
        //ModelAndView registerModelAndView = new ModelAndView("register");
        //System.out.println(user);
        String errorMessage = "";
        if (userService.isUserPresent(user.getUsername())) {
            errorMessage += "Username already exists! ";
        }
        if (userService.isEmailPresent(user.getEmail())) {
            if (errorMessage.equals("")) {
                errorMessage += "Email already exists! ";
            } else {
                errorMessage += ", Email already exists! ";
            }
        }
        if (userService.isPhonePresent(user.getPhone())) {
            if (errorMessage.equals("")) {
                errorMessage += "Phone already exists! ";
            } else {
                errorMessage += ", Phone already exists! ";
            }
        }

        if (!errorMessage.equals("")) {
            //model.addAttribute("errorMessage", errorMessage);
            Log log = new Log();
            log.setName("User " + user.getUsername() + " register failed");
            log.setDatetime(new Date());
            log.setStatus(0);
            logService.saveLog(log);
            //return registerModelAndView;
            ModelAndView modelAndView = new ModelAndView("redirect:/register");
            redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
            return modelAndView;
        }

        if (user.getPassword().equals(confirmPassword)) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setCreatedDate(new Date());
            user.setStatus(1);
            user.setGroupId(1);
            try {
                userService.saveUser(user);
                Log log = new Log();
                log.setName("User " + user.getUsername() + " registered");
                log.setDatetime(user.getCreatedDate());
                log.setStatus(1);
                logService.saveLog(log);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            //model.addAttribute("errorMessage", "Password and Confirm Password do not match!");
            ModelAndView modelAndView = new ModelAndView("redirect:/register");
            redirectAttributes.addFlashAttribute("errorMessage", "Password and Confirm Password do not match!");
            return modelAndView;
        }
        ModelAndView modelAndView = new ModelAndView("redirect:/login-page");
        redirectAttributes.addFlashAttribute("successMessage2", "User registered successfully!");

        //modelAndView.addObject("successMessage2", "User registered successfully!");
        return modelAndView;
    }
}
