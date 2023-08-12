package com.example.english_mcqbank.repository;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.Result;
import com.example.english_mcqbank.model.UserEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ResultRepository extends JpaRepository<Result, Integer> {
    List<Result> findAllByUser(UserEntity user, Pageable pageable);

    void deleteAllByExam(Exam exam);

    Boolean existsByExamAndUser(Exam exam, UserEntity user);

    List<Result> findAllByExam(Exam exam, Pageable pageable);

    List<Result> findAllByExam(Exam exam);

    List<Result> findAllByUser(UserEntity user);

    @Query(value = "SELECT * FROM results WHERE ex_id = :examId order by RS_SCORE desc ", nativeQuery = true)
    List<Result> findAllByExamAndOrderByScore(int examId);
}
