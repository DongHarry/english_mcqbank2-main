package com.example.english_mcqbank.controller;

import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.model.test.Parent;
import com.example.english_mcqbank.service.EmailSender;
import com.example.english_mcqbank.service.LoggedInUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
@RequiredArgsConstructor
public class MyController {
    private final EmailSender emailSender;

    @Autowired
    Parent test;

    @RequestMapping("/hello")
    public String hello() {
        test.doSomething();
        return "Hello world";
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
