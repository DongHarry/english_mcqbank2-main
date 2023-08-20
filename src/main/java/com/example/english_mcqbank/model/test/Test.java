package com.example.english_mcqbank.model.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.Calendar;
import java.util.Date;

public class Test {
    public static void main(String[] args) {
        // Tạo đối tượng Calendar
//        Calendar calendar = Calendar.getInstance();
//        calendar.add(Calendar.HOUR_OF_DAY, 24);
//        Date newDate = calendar.getTime();
//        System.out.println(newDate);
//        System.out.println(new Date());

        ZoneId defaultZoneId = ZoneId.systemDefault();
        System.out.println("System Default TimeZone : " + defaultZoneId);
        ZoneId utcZoneId = ZoneId.of("Asia/Ho_Chi_Minh");

        System.out.println("Request Zone ID (Assuming UTC): " + utcZoneId);
    }
}
