package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.UserEntity;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

@Service
public class VerifyService {
    private final Map<Long, String> verifyMap = new HashMap<>();

    public void addVerify(Long id, String verifyCode) {
        verifyMap.put(id, verifyCode);
    }

    public String getVerify(Long id) {
        return verifyMap.get(id);
    }

    public void removeVerify(Long id) {
        verifyMap.remove(id);
    }

    public boolean verify(Long id, String verifyCode) {
        return verifyMap.get(id).equals(verifyCode);
    }

    public String generateVerifyCode() {
        int length = 6;
        byte[] randomBytes = new byte[length];
        SecureRandom secureRandom = new SecureRandom();
        secureRandom.nextBytes(randomBytes);

        return Base64.getUrlEncoder().withoutPadding().encodeToString(randomBytes).toUpperCase();
    }

    public String generateVerifyCode(UserEntity user) {
        String verifyCode = generateVerifyCode();
        addVerify((long) user.getId(), verifyCode);
        return verifyCode;
    }

    public int getUserIdByVerifyToken(String token) {
        for (Map.Entry<Long, String> entry : verifyMap.entrySet()) {
            if (entry.getValue().equals(token)) {
                return entry.getKey().intValue();
            }
        }
        return -1;
    }
}
