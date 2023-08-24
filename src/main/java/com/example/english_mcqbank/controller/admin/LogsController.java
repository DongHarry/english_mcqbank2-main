package com.example.english_mcqbank.controller.admin;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class LogsController {
    private final UserDetailsServiceImpl userService;
    private final ILogService logService;
    private final ITopicService topicService;
    private final IQuestionService questionService;
    private final IExamService examService;
    private final IResultService resultService;
    private final ISessionService sessionService;

    @RequestMapping(value = "/admin/allLogs")
    public ModelAndView allLogs(@RequestParam(defaultValue = "0") int page,
                                @RequestParam(defaultValue = "20") int size) {
        ModelAndView modelAndView = new ModelAndView("allLogs");
        List<Log> logs = logService.findAllLogs();
        modelAndView.addObject("logs", logs);
//        modelAndView.addObject("currentPage", page);
//        assert logs != null;
//        boolean hasNext = logs.size() >= size;
//        modelAndView.addObject("hasNext", hasNext);

        return modelAndView;
    }

    @RequestMapping(value = "/admin/logs", method = RequestMethod.GET)
    public ModelAndView logs(@RequestParam(defaultValue = "0") int page,
                             @RequestParam(defaultValue = "10") int size) {
        ModelAndView modelAndView = new ModelAndView("allLogs");
        UserEntity user = sessionService.getLoggedInUser();
        modelAndView.addObject("user", user);
        //modelAndView.addObject("loggedInUser", user);

        List<Log> logs = logService.findAllLogs();
        modelAndView.addObject("logs", logs);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/logs/{logId}/delete", method = RequestMethod.GET)
    public ModelAndView deleteLog(@PathVariable int logId, RedirectAttributes redirectAttributes,
                                  @RequestParam(defaultValue = "0") Integer userId) {
        try {
            Log log = logService.findLogById(logId);
            if (log == null) {
                redirectAttributes.addFlashAttribute("message", "Log does not exist");
                if (userId != 0) {
                    return new ModelAndView("redirect:/admin/users/" + userId + "/logs");
                }
                return new ModelAndView("redirect:/admin/logs");
            }
            logService.deleteLog(log);
            redirectAttributes.addFlashAttribute("message", "Log deleted successfully");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("e_message", "Error deleting log");
        }

        if (userId != 0) {
            return new ModelAndView("redirect:/admin/users/" + userId + "/logs");
        }
        return new ModelAndView("redirect:/admin/logs");
    }
}
