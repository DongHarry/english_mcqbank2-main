package com.example.english_mcqbank.controller;

import com.example.english_mcqbank.model.test.Parent;
import com.example.english_mcqbank.service.IEmailSender;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@RestController
@RequestMapping("/")
@RequiredArgsConstructor
public class MyController {
    private final IEmailSender emailSender;

    @Autowired
    Parent test;

    @RequestMapping("/hello")
    public String hello() {
        test.doSomething();
        return "Hello world";
    }

    @RequestMapping("/test")
    public String test() {
        return "Test";
    }

    @RequestMapping(value = "/test/upload", method = RequestMethod.GET)
    public ModelAndView testUpload() {
        return new ModelAndView("uploadForm");
    }

    @RequestMapping(value = "/test/upload", method = RequestMethod.POST)
    public ModelAndView testUploadHandle(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return new ModelAndView("redirect:/test/upload");
        }

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // Xử lý từng dòng trong file CSV tại đây
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        redirectAttributes.addFlashAttribute("message", "File uploaded successfully");
        return new ModelAndView("redirect:/test/upload");
    }

    @RequestMapping("/send-email")
    public ResponseEntity<String> sendEmail() {
        emailSender.sendEmail("luongdinhduc0000@Gmail.com", "Test", "Test");
        return ResponseEntity.ok("Email sent");
    }

    @RequestMapping(value = "/abc", method = RequestMethod.POST)
    public void abc(@RequestParam("username") String username, @RequestParam("password") String password) {
        System.out.println("username: " + username);
        System.out.println("password: " + password);
    } 
}
