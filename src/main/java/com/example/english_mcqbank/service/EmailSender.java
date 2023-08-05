package com.example.english_mcqbank.service;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
@Slf4j
@NoArgsConstructor
public class EmailSender {
    private Environment env;

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    public EmailSender(Environment env) {
        this.env = env;
    }

    public void sendEmail(String to, String subject, String body) {
        log.info(this.getClass().getName() + " - sendEmail method invoked");
        Long start = System.currentTimeMillis();
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //simpleMailMessage.setFrom(env.getProperty("spring.mail.username"));
        simpleMailMessage.setTo(to);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setText(body);
        javaMailSender.send(simpleMailMessage);
        Long end = System.currentTimeMillis();
        log.info("Email sent.");
        log.info("Time elapsed: " + (end - start)/1000 + " seconds");

    }

    public void sendEmailWithCCAndBCC(String to, String cc, String bcc, String subject, String content) {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper;
        try {
            helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content);

            if (cc != null && !cc.isEmpty()) {
                helper.setCc(cc);
            }

            if (bcc != null && !bcc.isEmpty()) {
                helper.setBcc(bcc);
            }

            javaMailSender.send(message);
        } catch (MessagingException e) {
            // Xử lý ngoại lệ khi gửi email
            e.printStackTrace();
        }
    }
}
