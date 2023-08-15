package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.ExamTopic;
import com.example.english_mcqbank.model.Topic;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IExamTopicService {
    @Transactional
    List<ExamTopic> findAllByExam(Exam exam);

    @Transactional
    void deleteAllByExamId(int id);

    @Transactional
    void deleteAllByExam(Exam exam);

    int countAllByTopic(Topic topic);

    boolean existsByTopic(Topic topic);
}
