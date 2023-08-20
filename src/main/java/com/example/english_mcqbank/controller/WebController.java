package com.example.english_mcqbank.controller;


import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.concurrent.CompletableFuture;

@Controller
@RequiredArgsConstructor
public class WebController {
    final UserDetailsServiceImpl userService;
    final ILogService logService;
    final IExamService examService;
    final PasswordEncoder passwordEncoder;
    final IEmailSender emailSender;
    final VerifyService verifyService;
    final ISessionService sessionService;

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
        return new ModelAndView("redirect:/home#contact");
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            //sessionService.removeAttribute("loggedInUser");
            Log log = new Log();
            UserEntity user = sessionService.getLoggedInUser();
            log.setUser(user);
            log.setStatus(1);
            log.setIp(request.getRemoteAddr());
            log.setName(user.getUsername() + " logged out");
            logService.saveLog(log);
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
