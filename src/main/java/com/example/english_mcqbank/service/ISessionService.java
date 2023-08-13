package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.UserEntity;

public interface ISessionService {
    void setAttribute(String key, Object value);

    Object getAttribute(String key);

    UserEntity getLoggedInUser();

    void setLoggedInUser(UserEntity userEntity);

    void removeAttribute(String name);
}
