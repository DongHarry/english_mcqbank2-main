package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Question;
import com.example.english_mcqbank.model.Topic;
import com.example.english_mcqbank.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class QuestionService {
    @Autowired
    private QuestionRepository questionRepository;

    public List<Question> listAll() {
        return questionRepository.findAll();
    }

    public Question save(Question question) {
        return questionRepository.save(question);
    }

    public Question get(int id) {
        return questionRepository.findById(id).orElse(null);
    }

    @Transactional
    public void delete(int id) {
        questionRepository.deleteById(id);
    }

    public List<Question> findByTopicId(int topicId) {
        return questionRepository.findByTopicId(topicId);
    }

    public List<Question> findByTopicIdAndLevel(int topicId, int level) {
        return questionRepository.findByTopicIdAndLevel(topicId, level);
    }

    public List<Question> getRandom(int topicId, int level, int number) {
        if (topicId <= 0) {
            return questionRepository.findRandomQuestions(number,1);
        }

        if (level <= 0) {
            return questionRepository.findRandomQuestions(topicId, number,1);
        }

        return questionRepository.findRandomQuestions(topicId, level, number, 1);
    }

    public List<Question> getAllQuestions(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return questionRepository.findAll(pageable).getContent();
    }

    public List<Question> getRandom(Integer topicId, int level, int number, int examType) {
            if (topicId <= 0) {
                return questionRepository.findRandomQuestions(number, examType);
            }

            if (level <= 0) {
                return questionRepository.findRandomQuestions(topicId, number, examType);
            }

            return questionRepository.findRandomQuestions(topicId, level, number, examType);

    }

    public List<Question> getAllQuestions() {
        return questionRepository.findAll();
    }

    public Question getQuestionById(int id) {
        return questionRepository.findById(id).orElse(null);
    }

    public int countAllByTopic(Topic topic) {
        return questionRepository.countAllByTopic(topic);
    }
}
