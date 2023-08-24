package com.example.english_mcqbank.controller.user;

import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class EditProfileController {
    private final UserDetailsServiceImpl userService;
    private final ILogService logService;
    private final IExamService examService;
    private final IQuestionService questionService;
    private final IResultService resultService;
    private final ISessionService sessionService;
    private final PasswordEncoder passwordEncoder;


    @RequestMapping(value = "/user/profile/edit", method = RequestMethod.GET)
    public ModelAndView editUserProfile(Model model) {
        ModelAndView editUserModelAndView = new ModelAndView("editProfile");
        UserEntity user = sessionService.getLoggedInUser();
        //editUserModelAndView.addObject("loggedInUser", user);
        editUserModelAndView.addObject("type", 1);
        //UserEntity user = loggedInUserService.getLoggedInUser();

        if (user == null) {
            return new ModelAndView("redirect:/user/profile");
        }

        //editUserModelAndView.addObject("user", user);
        model.addAttribute("currentUser", user);
        return editUserModelAndView; // Trả về user.jsp
    }

    @RequestMapping(value = "/user/profile/edit", method = RequestMethod.POST)
    public ModelAndView editUserProfile(@ModelAttribute("currentUser") UserEntity user,
                                        RedirectAttributes redirectAttributes) {

        UserEntity userEntity = sessionService.getLoggedInUser();
        if (userEntity.getRoles()[0].equals("ROLE_ADMIN")) {
            sessionService.setAttribute("editProfile", "admin");
        }

        //UserEntity userEntity = loggedInUserService.getLoggedInUser();
        if (userEntity == null) {
            ModelAndView view = new ModelAndView("redirect:/user/profile/edit");
            redirectAttributes.addFlashAttribute("errorMessage", "User not found!");
            view.addObject("errorMessage", "User not found!");
            return view;
        }

        userEntity.setFullName(user.getFullName());
        if (!user.getEmail().equals(userEntity.getEmail()) && userService.isEmailPresent(user.getEmail())) {
            //redirectAttributes.addFlashAttribute("errorMessage", "Email is already in use!");
            //editUserModelAndView.addObject("errorMessage", "Email is already in use!");
            ModelAndView editUserModelAndView = new ModelAndView("redirect:/user/profile/edit");
            redirectAttributes.addFlashAttribute("errorMessage", "Email is already in use!");
            return editUserModelAndView;
        } else {
            userEntity.setEmail(user.getEmail());
        }

        if (!user.getPhone().equals(userEntity.getPhone()) && userService.isPhonePresent(user.getPhone())) {
            //redirectAttributes.addFlashAttribute("errorMessage", "Phone is already in use!");
            //editUserModelAndView.addObject("errorMessage", "Phone is already in use!");
            ModelAndView editUserModelAndView = new ModelAndView("redirect:/user/profile/edit");
            redirectAttributes.addFlashAttribute("errorMessage", "Phone is already in use!");
            return editUserModelAndView;
        } else {
            userEntity.setPhone(user.getPhone());
        }

        userEntity.setAddress(user.getAddress());

        try {
            userService.saveUser(userEntity);
            sessionService.setLoggedInUser(userEntity);
            redirectAttributes.addFlashAttribute("successMessage2", "Update profile successfully!");
            ModelAndView view = new ModelAndView("redirect:/user/profile");
            //redirectAttributes.addFlashAttribute("user", userEntity);
            //view.addObject("successMessage", "Update profile successfully!");
            return view;
            //return new ModelAndView("redirect:/user/profile");
        } catch (Exception e) {
            ModelAndView editUserModelAndView = new ModelAndView("redirect:/user/profile/edit");
            redirectAttributes.addFlashAttribute("errorMessage", "Update profile failed!");
            return editUserModelAndView;
        }
    }
}
