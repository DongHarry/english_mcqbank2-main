package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.Result;
import com.example.english_mcqbank.repository.ExamRepository;
import com.example.english_mcqbank.repository.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamService {
    @Autowired
    private ResultRepository resultService;

    @Autowired
    private ExamRepository examRepository;

    public List<Exam> getAllExams() {
        return examRepository.findAll();
    }

    public void saveExam(Exam exam) {
        examRepository.save(exam);
    }

    public Exam getExamById(int id) {
        return examRepository.findById(id).orElse(null);
    }

    public void deleteExam(Exam exam) {
        resultService.deleteAllByExam(exam);
        examRepository.delete(exam);
    }

    public List<Result> getResultsByExamId(int examId, int page, int size) {
        Exam exam = examRepository.findById(examId).orElse(null);

        if (exam == null) {
            return null;
        }
        Pageable pageable = PageRequest.of(page, size);

        return resultService.findAllByExam(exam, pageable);
    }
}
