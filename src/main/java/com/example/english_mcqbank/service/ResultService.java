package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.Result;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.repository.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResultService implements IResultService {
    @Autowired
    private ResultRepository resultRepository;

    @Override
    public List<Result> listAll() {
        return resultRepository.findAll();
    }

    @Override
    public void save(Result result) {
        resultRepository.save(result);
    }

    @Override
    public List<Result> findAllByUser(UserEntity user, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);

        return resultRepository.findAllByUser(user, pageable);
    }

    @Override
    public void deleteResultByExam(Exam exam) {
        resultRepository.deleteAllByExam(exam);
    }

    @Override
    public List<Result> getResultsByUser(UserEntity user, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);

        return resultRepository.findAllByUser(user, pageable);
    }

    @Override
    public List<Result> findAllByUser(UserEntity user) {
        return resultRepository.findAllByUser(user);
    }

    @Override
    public List<Result> getResultsByUser(UserEntity user) {
        return resultRepository.findAllByUser(user);
    }

    @Override
    public List<Result> findAllByExam(Exam exam) {
        return resultRepository.findAllByExam(exam);
    }

    @Override
    public void deleteAllByExam(Exam exam) {
        resultRepository.deleteAllByExam(exam);
    }

    @Override
    public List<Result> findAllByExam(Exam exam, Pageable pageable) {
        return resultRepository.findAllByExam(exam, pageable);
    }
}
