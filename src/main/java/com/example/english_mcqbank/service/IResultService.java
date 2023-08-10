package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.Result;
import com.example.english_mcqbank.model.UserEntity;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IResultService {
    List<Result> listAll();

    void save(Result result);

    List<Result> findAllByUser(UserEntity user, int page, int size);

    void deleteResultByExam(Exam exam);

    List<Result> getResultsByUser(UserEntity user, int page, int size);

    List<Result> findAllByUser(UserEntity user);

    List<Result> getResultsByUser(UserEntity user);

    List<Result> findAllByExam(Exam exam);

    void deleteAllByExam(Exam exam);

    List<Result> findAllByExam(Exam exam, Pageable pageable);
}
