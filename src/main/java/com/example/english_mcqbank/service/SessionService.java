package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.UserEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
public class SessionService implements ISessionService {
    private final HttpSession session;

    @Override
    public void setAttribute(String key, Object value) {
        session.setAttribute(key, value);
    }

    @Override
    public Object getAttribute(String key) {
        return session.getAttribute(key);
    }

    @Override
    public UserEntity getLoggedInUser() {
        return session.getAttribute("loggedInUser") != null ? (UserEntity) session.getAttribute("loggedInUser") : null;
    }

}
