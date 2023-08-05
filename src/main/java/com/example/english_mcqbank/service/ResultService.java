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
public class ResultService {
    @Autowired
    private ResultRepository resultRepository;

    public List<Result> listAll() {
        return resultRepository.findAll();
    }

    public void save(Result result) {
        resultRepository.save(result);
    }

    public List<Result> findAllByUser(UserEntity user, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);

        return resultRepository.findAllByUser(user, pageable);
    }

    public void deleteResultByExam(Exam exam) {
        resultRepository.deleteAllByExam(exam);
    }
}
