package com.example.english_mcqbank.controller;


import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.EmailSender;
import com.example.english_mcqbank.service.ExamService;
import com.example.english_mcqbank.service.LogService;
import com.example.english_mcqbank.service.UserDetailsServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class WebController {
    final UserDetailsServiceImpl userService;
    final LogService logService;
    final ExamService examService;
    final PasswordEncoder passwordEncoder;
    final EmailSender emailSender;

    @RequestMapping(value = {"/", "/home", "/index"})
    public ModelAndView homepage(Authentication authentication) {
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

        return new ModelAndView("index"); // Trả về index.jsp
    }



    @RequestMapping("/admin")
    public ModelAndView admin(Authentication authentication) {
        ModelAndView adminModelAndView = new ModelAndView("admin");
        adminModelAndView.addObject("admin", "admin");
        //List<UserEntity> users = userService.getAllUsers();
        //adminModelAndView.addObject("users", users);
        UserEntity user = userService.getUserByUsername(authentication.getName());
        adminModelAndView.addObject("user", user);
        adminModelAndView.addObject("nullValue", null);
        return adminModelAndView; // Trả về admin.jsp
    }



    @RequestMapping("/user")
    public ModelAndView user(Authentication authentication) {
        ModelAndView userModelAndView = new ModelAndView("user");
        userModelAndView.addObject("username", authentication.getName());
        return userModelAndView; // Trả về user.jsp
    }



    @RequestMapping(value = "/sendContactMail", method = RequestMethod.POST)
    public ModelAndView sendContactMail(@RequestParam("name") String name,
                                        @RequestParam("email") String email,
                                        @RequestParam("phone") String phone,
                                        @RequestParam("company") String company,
                                        @RequestParam("message") String message) {



        String subject = "Contact from " + name;

        String content = "Name: " + name + "\n" +
                "Email: " + email + "\n" +
                "Phone: " + phone + "\n" +
                "Company: " + company + "\n" +
                "Message: " + message + "\n";

        emailSender.sendEmail("luongdinhduc0000@gmail.com", email, subject, content);
        //return new ModelAndView("redirect:/#");
        return new ModelAndView("test");
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login-page?logout"; //You can redirect wherever you want, but generally it's a good practice to show login screen again.
    }


    /*public boolean isAdmin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null && authentication.getAuthorities().stream()
                .anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"));
    }*/
}
