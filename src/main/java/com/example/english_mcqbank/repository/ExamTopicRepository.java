package com.example.english_mcqbank.repository;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.ExamTopic;
import com.example.english_mcqbank.model.Topic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ExamTopicRepository extends JpaRepository<ExamTopic, Integer> {
    void deleteAllByExam(Exam exam);

    @Query(value = "delete from exam_topic where ex_id = :examId", nativeQuery = true)
    void deleteAllByExamNative(int examId);

    List<ExamTopic> findAllByExam(Exam exam);

    int countAllByTopic(Topic topic);

    boolean existsByTopic(Topic topic);
}
