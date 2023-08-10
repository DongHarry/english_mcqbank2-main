package com.example.english_mcqbank.controller.user;

import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class ChangePasswordController {
    final UserDetailsServiceImpl userService;
    final ILogService ILogService;
    final IExamService IExamService;
    final IQuestionService IQuestionService;
    final IResultService IResultService;
    final PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/user/profile/change-password", method = RequestMethod.GET)
    public ModelAndView changePassword(Authentication authentication) {
        ModelAndView changePasswordModelAndView = new ModelAndView("change-password");
        UserEntity loggedInUser = userService.getUserByUsername(authentication.getName());
        changePasswordModelAndView.addObject("loggedInUser", loggedInUser);
        changePasswordModelAndView.addObject("type", 1);
        return changePasswordModelAndView; // Trả về user.jsp
    }
    @RequestMapping(value = "/user/profile/change-password", method = RequestMethod.POST)
    public ModelAndView changePassword(@RequestParam("oldPassword") String oldPassword,
                                       @RequestParam("newPassword") String newPassword,
                                       @RequestParam("confirmNewPassword") String confirmNewPassword,
                                       Authentication authentication, RedirectAttributes redirectAttributes) {
        String username = authentication.getName();
        UserEntity user = userService.getUserByUsername(username);
        //UserEntity user = loggedInUserService.getLoggedInUser();
        boolean check = passwordEncoder.matches(oldPassword, user.getPassword());

        if (!check) {
            //redirectAttributes.addFlashAttribute("errorMessage", "Incorrect password!");
            ModelAndView view = new ModelAndView("redirect:/user/profile/change-password");
            redirectAttributes.addFlashAttribute("errorMessage", "Incorrect password!");
            //view.addObject("errorMessage", "Incorrect password!");
            //return new ModelAndView("redirect:/user/profile/change-password");
            return view;
        }

        if (newPassword.equals(confirmNewPassword)) {
            user.setPassword(passwordEncoder.encode(newPassword));
            userService.saveUser(user);
            //redirectAttributes.addFlashAttribute("successMessage", "Update Password successfully!");
            ModelAndView view = new ModelAndView("redirect:/user/profile");
            redirectAttributes.addFlashAttribute("successMessage", "Update Password successfully!");
            view.addObject("successMessage", "Update Password successfully!");
            return view;
        }

//        redirectAttributes.addFlashAttribute("errorMessage", "Password and Confirm Password do not match!");
//
//        return new ModelAndView("redirect:/user/profile/change-password");
        ModelAndView view = new ModelAndView("redirect:/user/profile/change-password");
        redirectAttributes.addFlashAttribute("errorMessage", "Password and Confirm Password do not match!");
        //view.addObject("errorMessage", "Password and Confirm Password do not match!");
        return view;
    }
}
