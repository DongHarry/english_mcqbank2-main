package com.example.english_mcqbank.controller.admin;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.Result;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AllUserController {
    final UserDetailsServiceImpl userService;
    final ILogService logService;
    final ITopicService topicService;
    final IQuestionService questionService;
    final IExamService examService;
    final IResultService resultService;
    final ISessionService sessionService;
    final PasswordEncoder passwordEncoder;

    @RequestMapping("/admin/users/{id}")
    public ModelAndView viewUser(@PathVariable Integer id) {
        ModelAndView view = new ModelAndView("profile");
        UserEntity user = userService.getUserByUserid(id);
        view.addObject("user", user);
        sessionService.setAttribute("type3", 2);
        //UserEntity loggedInUser = sessionService.getLoggedInUser();
        //view.addObject("loggedInUser", loggedInUser);
        view.addObject("type", 2);
        return view; // Trả về admin.jsp
    }

    @RequestMapping("/admin/users/{id}/logs")
    public ModelAndView viewUserLogs(@PathVariable Integer id,
                                     @RequestParam(defaultValue = "0") int page,
                                     @RequestParam(defaultValue = "20") int size,
                                     RedirectAttributes redirectAttributes) {
        UserEntity user = userService.getUserByUserid(id);
        if (user == null) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/users");
            redirectAttributes.addFlashAttribute("errorMessage", "User does not exist");
            return modelAndView;
        }

        ModelAndView logsModelAndView = new ModelAndView("logs");
        List<Log> logs = logService.getLogsByUser(user);
        sessionService.setAttribute("type3", 2);
        logsModelAndView.addObject("logs", logs);

        if (logs == null || logs.isEmpty()) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/users/" + id);
            redirectAttributes.addFlashAttribute("errorMessage", "No logs found");
            return modelAndView;

        }

        //UserEntity loggedInUser = sessionService.getLoggedInUser();
        //logsModelAndView.addObject("loggedInUser", loggedInUser);
//        logsModelAndView.addObject("currentPage", page);
//        assert logs != null;
//        boolean hasNext = logs.size() >= size;
//        logsModelAndView.addObject("hasNext", hasNext);
        return logsModelAndView; // Trả về admin.jsp
    }

    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public ModelAndView users(@RequestParam(defaultValue = "0") int page,
                              @RequestParam(defaultValue = "10") int size) {
        sessionService.setAttribute("type3", 2);
        ModelAndView usersModelAndView = new ModelAndView("allUsers");
        //List<UserEntity> users = userService.getAllUsers(page, size);
        List<UserEntity> users = userService.getAllUsers();
        //UserEntity loggedInUser = sessionService.getLoggedInUser();
        //usersModelAndView.addObject("loggedInUser", loggedInUser);
        usersModelAndView.addObject("users", users);
        //usersModelAndView.addObject("currentPage", page);
        usersModelAndView.addObject("type", 2);
        //assert users != null;
        //boolean hasNext = users.size() >= size;
        //usersModelAndView.addObject("hasNext", hasNext);

        return usersModelAndView; // Trả về admin.jsp
    }

    @RequestMapping(value = "/admin/users/new", method = RequestMethod.GET)
    public ModelAndView addUser(Model model) {
        model.addAttribute("user", new UserEntity());
        ModelAndView modelAndView = new ModelAndView("addUser");
        modelAndView.addObject("type", 3);
        UserEntity loggedInUser = sessionService.getLoggedInUser();
        //modelAndView.addObject("loggedInUser", loggedInUser);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/addUser", method = RequestMethod.POST)
    public ModelAndView registerUser(RedirectAttributes redirectAttributes,
                                     @ModelAttribute("user") UserEntity user,
                                     @RequestParam("confirmPassword") String confirmPassword,
                                     @RequestParam("role") String role) {
        if (userService.isUserPresent(user.getUsername())
                || userService.isEmailPresent(user.getEmail())
                || userService.isPhonePresent(user.getPhone())) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/users/new");
            redirectAttributes.addFlashAttribute("message", "User already exists");
            //modelAndView.addObject("message", "User already exists");
            return modelAndView;
        }

        if (!user.getPassword().equals(confirmPassword)) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/users/new");
            redirectAttributes.addFlashAttribute("message", "Password does not match");
            //modelAndView.addObject("message", "Password does not match");
            return modelAndView;
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setCreatedDate(new Date());
        user.setStatus(1);
        if (role.equals("admin")) {
            user.setGroupId(0);
        } else {
            user.setGroupId(1);
        }

        try {
            userService.saveUser(user);
            redirectAttributes.addFlashAttribute("message", "User " + user.getUsername() + " added successfully!");
            Log log = new Log();
            log.setUser(user);
            log.setStatus(1);
            log.setDatetime(new Date());
            log.setName("User added successfully!");
            logService.saveLog(log);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error adding user");
        }

        return new ModelAndView("redirect:/admin/users");
    }


    @RequestMapping(value = "/admin/delete")
    public ModelAndView deleteUser(@RequestParam("username") String username, RedirectAttributes redirectAttributes) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/users");
        try {
            UserEntity user = userService.getUserByUsername(username);
            if (user == null) {
                redirectAttributes.addFlashAttribute("errorMessage", "User does not exist");
//                return new ModelAndView("allUsers");
//                modelAndView.addObject("message", "User does not exist");
                return modelAndView;
            }
            if (user.getGroupId() == 0) {
                redirectAttributes.addFlashAttribute("errorMessage", "Cannot delete admin");
//                return new ModelAndView("allUsers");
//                modelAndView.addObject("message", "Cannot delete admin");
                return modelAndView;
            }
            List<Log> logs = logService.getLogsByUser(user);
            if (logs != null) {
                logService.deleteAllLog(logs);
            }
            userService.deleteUser(user);
            //modelAndView.addObject("message", "User deleted successfully");
            redirectAttributes.addFlashAttribute("message", "User deleted successfully");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error deleting user");
        }

        return modelAndView;
    }

    @RequestMapping(value = "/admin/users/{userId}/results", method = RequestMethod.GET)
    public ModelAndView userResults(@RequestParam(defaultValue = "0") int page,
                                    @RequestParam(defaultValue = "10") int size,
                                    @PathVariable("userId") int userId,
                                    RedirectAttributes redirectAttributes) {

        UserEntity user = userService.getUserByUserid(userId);
        List<Result> results = resultService.findAllByUser(user);

        if (results == null || results.isEmpty()) {
            ModelAndView modelAndView1 = new ModelAndView("redirect:/admin/users/" + userId);
            redirectAttributes.addFlashAttribute("errorMessage", "No results found for user: " + user.getUsername());
            return modelAndView1;
        }

        ModelAndView modelAndView = new ModelAndView("userResult");
        modelAndView.addObject("results", results);
        UserEntity loggedInUser = sessionService.getLoggedInUser();
        //modelAndView.addObject("loggedInUser", loggedInUser);
        modelAndView.addObject("type", 1);
        modelAndView.addObject("userId", user.getId());
        modelAndView.addObject("ranking", false);
//        modelAndView.addObject("currentPage", page);
//        assert results != null;
//        boolean hasNext = results.size() >= size;
//        modelAndView.addObject("hasNext", hasNext);
        modelAndView.addObject("title", "All results for user: " + user.getFullName());
        //modelAndView.addObject("examId", examId);
        return modelAndView;
    }
}
