package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.ExamTopic;
import com.example.english_mcqbank.model.Topic;
import com.example.english_mcqbank.repository.ExamTopicRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ExamTopicService implements IExamTopicService {
    private final ExamTopicRepository examTopicRepository;

    @Override
    @Transactional
    public List<ExamTopic> findAllByExam(Exam exam) {
        return examTopicRepository.findAllByExam(exam);
    }

    @Override
    @Transactional
    public void deleteAllByExamId(int id) {
        examTopicRepository.deleteAllByExamNative(id);
    }

    @Override
    @Transactional
    public void deleteAllByExam(Exam exam) {
        examTopicRepository.deleteAllByExam(exam);
    }

    @Override
    public int countAllByTopic(Topic topic) {
        return examTopicRepository.countAllByTopic(topic);
    }

    @Override
    public boolean existsByTopic(Topic topic) {
        return examTopicRepository.existsByTopic(topic);
    }
}
