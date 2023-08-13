package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.UserEntity;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IUserService {
    UserEntity getUserByUsername(String username);

    void deleteUserByUsername(String username);

    List<UserEntity> getAllUsers();

    Boolean isUserPresent(String username);

    Boolean isEmailPresent(String email);

    Boolean isPhonePresent(String phone);

    void saveUser(UserEntity user);

    UserEntity getUserByUserid(int id);

    @Transactional
    void deleteUser(UserEntity user);

    List<UserEntity> getAllUsers(int page, int size);

    UserEntity getUserByEmail(String email);
}
