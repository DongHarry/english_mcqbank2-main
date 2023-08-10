package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.repository.ExamTopicRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExamTopicService {
    @Autowired
    private ExamTopicRepository examTopicRepository;

    public void deleteAllByExam(Exam exam) {
        examTopicRepository.deleteAllByExam(exam);
    }
}
