package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.UserEntity;
import org.springframework.stereotype.Service;

@Service
public class LoggedInUserService {
    private UserEntity loggedInUser;

    public UserEntity getLoggedInUser() {
        return loggedInUser;
    }

    public void setLoggedInUser(UserEntity loggedInUser) {
        this.loggedInUser = loggedInUser;
    }
}
