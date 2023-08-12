package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.UserEntity;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface IUserService {
    public UserEntity getUserByUsername(String username);

    public void deleteUserByUsername(String username);

    public List<UserEntity> getAllUsers();

    public Boolean isUserPresent(String username);

    public Boolean isEmailPresent(String email);

    public Boolean isPhonePresent(String phone);

    public void saveUser(UserEntity user);

    public UserEntity getUserByUserid(int id);

    @Transactional
    public void deleteUser(UserEntity user);

    public List<UserEntity> getAllUsers(int page, int size);

    public UserEntity getUserByEmail(String email);
}
