package com.example.english_mcqbank.repository;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.ExamTopic;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExamTopicRepository extends JpaRepository<ExamTopic, Integer> {
    void deleteAllByExam(Exam exam);
}
