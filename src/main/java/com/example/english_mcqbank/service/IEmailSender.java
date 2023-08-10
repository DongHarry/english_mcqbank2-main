package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.UserEntity;
import org.springframework.scheduling.annotation.Async;

import java.util.concurrent.CompletableFuture;

public interface IEmailSender {
    CompletableFuture<Void> sendEmail2(String to, String subject, String body);

    @Async
    void sendEmail(String to, String subject, String body);

    @Async
    void sendEmail(String to, String cc, String subject, String content);

    CompletableFuture<Void> sendEmail2(String to, String cc, String subject, String body);

    void sendResetPasswordEmail(UserEntity user, String url);
}
