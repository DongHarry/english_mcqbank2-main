package com.example.english_mcqbank.repository;

import com.example.english_mcqbank.model.Exam;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExamRepository extends JpaRepository<Exam, Integer> {
}
