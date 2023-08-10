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
public class QuestionService implements IQuestionService {
    @Autowired
    private QuestionRepository questionRepository;

    @Override
    public List<Question> listAll() {
        return questionRepository.findAll();
    }

    @Override
    public Question save(Question question) {
        return questionRepository.save(question);
    }

    @Override
    public Question get(int id) {
        return questionRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public void delete(int id) {
        questionRepository.deleteById(id);
    }

    @Override
    public List<Question> findByTopicId(int topicId) {
        return questionRepository.findByTopicId(topicId);
    }

    @Override
    public List<Question> findByTopicIdAndLevel(int topicId, int level) {
        return questionRepository.findByTopicIdAndLevel(topicId, level);
    }

    @Override
    public List<Question> getRandom(int topicId, int level, int number) {
        if (topicId <= 0) {
            return questionRepository.findRandomQuestions(number,1);
        }

        if (level <= 0) {
            return questionRepository.findRandomQuestions(topicId, number,1);
        }

        return questionRepository.findRandomQuestions(topicId, level, number, 1);
    }

    @Override
    public List<Question> getAllQuestions(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return questionRepository.findAll(pageable).getContent();
    }

    @Override
    public List<Question> getRandom(Integer topicId, int level, int number, int examType) {
            if (topicId <= 0) {
                return questionRepository.findRandomQuestions(number, examType);
            }

            if (level <= 0) {
                return questionRepository.findRandomQuestions(topicId, number, examType);
            }

            return questionRepository.findRandomQuestions(topicId, level, number, examType);

    }

    @Override
    public List<Question> getAllQuestions() {
        return questionRepository.findAll();
    }

    @Override
    public Question getQuestionById(int id) {
        return questionRepository.findById(id).orElse(null);
    }

    @Override
    public int countAllByTopic(Topic topic) {
        return questionRepository.countAllByTopic(topic);
    }

    @Override
    public void delete(Question question) {
        questionRepository.delete(question);
    }

    @Override
    public boolean existByContent(String content) {
        return questionRepository.existsByContent(content);
    }
}
