package com.example.english_mcqbank.repository;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.ExamTopic;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExamTopicRepository extends JpaRepository<ExamTopic, Integer> {
    void deleteAllByExam(Exam exam);

    List<ExamTopic> findAllByExam(Exam exam);
}
