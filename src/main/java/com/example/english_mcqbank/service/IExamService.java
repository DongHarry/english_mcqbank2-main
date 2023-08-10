package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.Result;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface IExamService {
    List<Exam> getAllExams(int page, int size);

    @Transactional
    void saveExam(Exam exam);

    Exam getExamById(int id);

    @Transactional
    void deleteExam(Exam exam);

    List<Result> getResultsByExamId(int examId, int page, int size);

    List<Result> getResultsByExamId(int examId);

    Map<Long, Integer> getExamTopicPercentageMap(Map<String, String> requestParams);

    int calculateScore(Map<String, String> params);

    List<Exam> getAllExams();

    void addExamTopic(Exam exam, Map<Long, Integer> examTopicPercentageMap);

    int getTotalPercentage(Map<Long, Integer> examTopicPercentageMap);

    void updateExamTopic(Exam exam, Map<Long, Integer> examTopicPercentageMap);
}
