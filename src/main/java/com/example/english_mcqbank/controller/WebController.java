package com.example.english_mcqbank.controller;


import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.concurrent.CompletableFuture;

@Controller
@RequiredArgsConstructor
public class WebController {
    final UserDetailsServiceImpl userService;
    final LogService logService;
    final ExamService examService;
    final PasswordEncoder passwordEncoder;
    final EmailSender emailSender;
    final VerifyService verifyService;

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

    @RequestMapping(value = "/index.html", method = RequestMethod.GET)
    public ModelAndView index() {
        return new ModelAndView("index");
    }



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



    @RequestMapping("/user")
    public ModelAndView user(Authentication authentication) {
        ModelAndView userModelAndView = new ModelAndView("user");
        userModelAndView.addObject("user", userService.getUserByUsername(authentication.getName()));
        return userModelAndView; // Trả về user.jsp
    }





    @RequestMapping(value = "/sendContactMail", method = RequestMethod.POST)
    public ModelAndView sendContactMail(@RequestParam("name") String name,
                                        @RequestParam("email") String email,
                                        @RequestParam("phone") String phone,
                                        @RequestParam("company") String company,
                                        @RequestParam("message") String message,
                                        RedirectAttributes redirectAttributes) {

        String subject = "Contact from " + name;
        String content = "Name: " + name + "\n" +
                "Email: " + email + "\n" +
                "Phone: " + phone + "\n" +
                "Company: " + company + "\n" +
                "Message: " + message + "\n";

        CompletableFuture<Void> completableFuture = emailSender.sendEmail2(EmailSender.ADMIN_EMAIL_ADDRESS, email, subject, content);
        //return new ModelAndView("redirect:/#");
        //ModelAndView view = new ModelAndView("redirect:/home");
        redirectAttributes.addFlashAttribute("message5", "Your email has been sent!");
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
            emailSender.sendResetPasswordEmail(user,url);
        } else {
            UserEntity user = userService.getUserByUsername(name);
            if (user == null) {
                ModelAndView modelAndView = new ModelAndView("redirect:/forgot-password");
                //modelAndView.addObject("message2", "Username not found!");
                redirectAttributes.addFlashAttribute("message2", "Username not found!");
                return modelAndView;
            }
            emailSender.sendResetPasswordEmail(user,url);
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
            ModelAndView modelAndView = new ModelAndView("redirect:/login-page");
            //modelAndView.addObject("errorMessage3", "Token not found!");
            redirectAttributes.addFlashAttribute("errorMessage3", "Token not found!");
            return modelAndView;
        }
        UserEntity user = userService.getUserByUserid(userId);
        if (user == null) {
            ModelAndView modelAndView = new ModelAndView("redirect:/login-page");
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
            ModelAndView modelAndView = new ModelAndView("redirect:/login-page");
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
        return modelAndView;
    }

    /*public boolean isAdmin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null && authentication.getAuthorities().stream()
                .anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"));
    }*/
}
