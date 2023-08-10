package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.ExamTopic;
import com.example.english_mcqbank.repository.ExamTopicRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamTopicService {
    @Autowired
    private ExamTopicRepository examTopicRepository;

    public List<ExamTopic> findAllByExam(Exam exam) {
        return examTopicRepository.findAllByExam(exam);
    }

    public void deleteAllByExam(Exam exam) {
        examTopicRepository.deleteAllByExamNative(exam.getId());
    }
}
