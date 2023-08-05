package com.example.english_mcqbank.repository;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.Result;
import com.example.english_mcqbank.model.UserEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ResultRepository extends JpaRepository<Result, Integer> {
    List<Result> findAllByUser(UserEntity user, Pageable pageable);

    void deleteAllByExam(Exam exam);

    List<Result> findAllByExam(Exam exam, Pageable pageable);
}
