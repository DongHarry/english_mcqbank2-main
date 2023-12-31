package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.UserEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

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
    @Cacheable(value = "loggedInUserCache")
    public UserEntity getLoggedInUser() {
        return session.getAttribute("loggedInUser") != null ? (UserEntity) session.getAttribute("loggedInUser") : null;
    }

    @Override
    public void setLoggedInUser(UserEntity userEntity) {
        session.setAttribute("loggedInUser", userEntity);
    }

    @Override
    public void removeAttribute(String name) {
        session.removeAttribute(name);
    }

}
