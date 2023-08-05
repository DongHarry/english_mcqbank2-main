package com.example.english_mcqbank.repository;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LogRepository extends JpaRepository<Log, Integer> {
    Log findByUser(UserEntity user);

    List<Log> findAllByUser(UserEntity user);

    Page<Log> findAllByUser(UserEntity user, Pageable pageable);
}
